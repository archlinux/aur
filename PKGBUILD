# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}
pkgver=1.1.0
pkgrel=1
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname}-git)
makedepends=(git rust make)
source=("https://github.com/pop-os/system76-scheduler/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('SKIP')
install=install.sh
backup=(
  'etc/system76-scheduler/assignments/default.ron'
)

build() {
  cd ${_pkgname}-${pkgver}
  make
}

package() {
  cd ${_pkgname}-${pkgver}
  DESTDIR=${pkgdir} make install
}
