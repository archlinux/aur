# Maintainer: Clint Valentine <valentine.clint@gmail.com>

pkgname=pmonitor-git
pkgver=r15.97604f3
pkgrel=3
pkgdesc="Monitor a job's progress"
arch=('i686' 'x86_64')
url="https://github.com/dspinellis/pmonitor"
license=('Apache2.0')
depends=('lsof')
provides=('pmonitor')
conflicts=('pmonitor')
source=("git+https://github.com/dspinellis/pmonitor.git")
md5sums=('SKIP')

pkgver() {
  cd "pmonitor"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/pmonitor"
  make
}

package() {
  cd "${srcdir}/pmonitor"
  install -Dm755 pmonitor.sh "${pkgdir}/usr/bin/pmonitor"
  install -Dm655 pmonitor.1 "${pkgdir}/usr/share/man/man1/pmonitor.1"
  install -Dm655 README.md "${pkgdir}/usr/share/doc/pmonitor/README"
  install -Dm655 LICENSE "${pkgdir}/usr/share/licenses/pmonitor/LICENSE"
}
