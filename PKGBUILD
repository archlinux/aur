pkgname=fetch-git
_pkgname=fetch
pkgver=2.0.0
pkgrel=1
pkgdesc="An animated 3D fetch tool for your terminal"
arch=(x86_64 aarch64)
url="https://github.com/areofyl/fetch"
license=(ISC)
depends=(glibc)
source=("https://github.com/areofyl/fetch/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
  cd "${_pkgname}-${pkgver}"
  make CC=cc CFLAGS="-O2"
}

package() {
  cd "${_pkgname}-${pkgver}"
  make PREFIX="${pkgdir}/usr" install
}
