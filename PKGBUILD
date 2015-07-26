# Maintainer: OS Hazard <oshazard+aur@gmail.com>
pkgname=apacman-utils
pkgver=0.1
pkgrel=1
pkgdesc="AUR utilities: apac-migrate and aurpush"
url="http://github.com/oshazard/apacman-utils"
license="GPL"
arch=('any')
makedepends=('')
depends=('apacman' 'git' 'openssh' 'pkgbuild-introspection')
provides=('apac-migrate' 'aurpush')
source=("https://github.com/oshazard/apacman-utils/archive/master.tar.gz")
md5sums=('5802f2b890271ec18f2124a8f5296888')

package() {
  cd "${srcdir}/apacman-utils-master"

  # Install scripts
  mkdir -p "$pkgdir/usr/bin"
  install -m755 apac-migrate "$pkgdir/usr/bin/apac-migrate"
  install -m755 aurpush "$pkgdir/usr/bin/aurpush"

  # Install license
  mkdir -p "${pkgdir}/usr/share/licenses/apacman-utils"
  install -m644 LICENSE ${pkgdir}/usr/share/licenses/apacman-utils/LICENSE
}
