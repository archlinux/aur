# Maintainer: Dan Johansen <strit@manjaro.org>

_pkgname=DesQArchiver
pkgname=desq-apps-archiver
pkgver=0.0.7
pkgrel=1
pkgdesc="A simple file archiver for DesQ"
arch=('x86_64' 'aarch64')
url="https://gitlab.com/DesQ/DesQApps/${_pkgname}"
license=('GPL3')
depends=('qt5-base' 'libarchive-qt' 'libdesqui')
makedepends=('meson' 'ninja')
source=("https://gitlab.com/DesQ/DesQApps/${_pkgname}/-/archive/v${pkgver}/${_pkgname}-v${pkgver}.tar.gz")
md5sums=('d5f91021f376660405f5655e20d8ce37')

build() {
  cd "${_pkgname}-v${pkgver}"
  meson .build --prefix=/usr --buildtype=release
  ninja -C .build
}

package() {
  cd "${_pkgname}-v${pkgver}"
  DESTDIR="${pkgdir}" ninja -C .build install
}

