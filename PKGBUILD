# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
# Contributor: Antoni Marzec <marzeqmarzeq at gmail dot com>

_basename=koharu
pkgname=${_basename}-bin
pkgver=0.86.0
pkgrel=1
pkgdesc="Manga translation tools"
arch=("x86_64")
url="https://github.com/koharu-rs/koharu"
license=("GPL-3.0")
depends=("gtk3" "gdk-pixbuf2" "glib2" "fontconfig" "openssl" "gcc-libs")
optdepends=(
  "llama.cpp: local LLM"
  "stable-diffusion.cpp: local image impainting"
)
provides=("$_basename")
conflicts=("$_basename")
options=("!debug")
makedepends=("libarchive")

source=("$_basename-${pkgver}.deb::https://github.com/mayocream/koharu/releases/download/${pkgver}/koharu_${pkgver}_amd64.deb")

sha256sums=('f4041fd300a16ab5faa59e37b6ca82e93d8251d22692f4030fff5f87c7bccd67')

package() {
  bsdtar -xf "$srcdir/$_basename-${pkgver}.deb" data.tar.gz
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
