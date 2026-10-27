# Maintainer: Theodore Huang <teddyhuangnan@gmail.com>
# Contributor: Antoni Marzec <marzeqmarzeq at gmail dot com>

_basename=koharu
pkgname=${_basename}-bin
pkgver=0.83.5
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

sha256sums=('e4151e59994ceaa31468c9d4b6456dc8287c096887e493dac9c06dbef0a444c2')

package() {
  bsdtar -xf "$srcdir/$_basename-${pkgver}.deb" data.tar.gz
  bsdtar -xf data.tar.gz -C "$pkgdir"
}
