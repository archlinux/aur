# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}-git
pkgver=1.1.0.1.gcbccc2e
pkgrel=1
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=()
makedepends=(git rust make)
source=("git+$url")
sha256sums=('SKIP')
install=install.sh

pkgver() {
  cd ${_pkgname}
  git describe --tags | sed -e "s/^v//" | tr '-' '.'
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  DESTDIR=${pkgdir} make install
}
