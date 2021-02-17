# Maintainer tinywrkb <tinywrkb@gmail.com>

pkgname=fsverity-utils
pkgver=1.3
pkgrel=3
pkgdesc='Userspace utilities for fs-verity'
url='https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/fsverity-utils.git'
license=('custom:MIT')
source=("${url}/snapshot/${pkgname}-${pkgver}.tar.gz")
sha256sums=('89277d06452ce16dc10a1c7b54243e732c8b63a4387c713ef4382817f0d7f3ac')
arch=('x86_64')

build() {
  cd ${pkgname}-${pkgver}
  make USE_SHARED_LIB=1 PREFIX=/usr DESTDIR=${pkgdir}
}

package() {
  cd ${pkgname}-${pkgver}
  make USE_SHARED_LIB=1 PREFIX=/usr DESTDIR=${pkgdir} install
  install -Dm644 LICENSE -t ${pkgdir}/usr/share/licenses/${pkgname}/
  install -Dm644 README.md -t ${pkgdir}/usr/share/docs/${pkgname}/
}
