# Maintainer: Donald Carr <d _at_ chaos-reins.com>

_pkgname=system76-scheduler
pkgname=${_pkgname}-git
pkgver=1.1.0.2.g7d107f3
pkgrel=1
epoch=2
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=()
provides=(${_pkgname})
conflicts=(${_pkgname})
makedepends=(git rust make)
source=("git+$url")
sha256sums=('SKIP')
install=install.sh
backup=(
  'etc/system76-scheduler/assignments/default.ron'
)

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
