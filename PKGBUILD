_pkgname=system76-scheduler
pkgname=${_pkgname}-git
pkgver=r22.4b77ff4
pkgrel=1
pkgdesc='system76 userspace scheduler'
arch=(x86_64)
url='https://github.com/pop-os/system76-scheduler'
license=('MPL-2')
depends=()
makedepends=(rust make)
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd ${_pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${_pkgname}
  make
}

package() {
  cd ${_pkgname}
  DESTDIR=${pkgdir} make install
}
