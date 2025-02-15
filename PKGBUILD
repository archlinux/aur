pkgname=xrandrstub
pkgver=1.0.0
pkgrel=1
pkgdesc="A library designed to be LD_PRELOAD'ed to disable xrandr."
license=('GPL3')
arch=('x86_64')
url="https://github.com/mads256h/libxrandrstub"
makedepends=('libxrandr')
source=("lib${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('ab3d8537f7fed575de509f6a9bb37db6077efd74ae2746c7ab25cf75baa75836')

build() {
  cd "lib${pkgname}-${pkgver}"
  make
}

package() {
  cd "lib${pkgname}-${pkgver}"
  mkdir -p "${pkgdir}/usr/lib"
  mkdir -p "${pkgdir}/usr/bin"
  make "PREFIX=${pkgdir}/usr" install
}
