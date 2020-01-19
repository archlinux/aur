# Maintainer mober <maxATmoberDOTat>
# Thanks to:
# * Yuen Hoe (Jason moofang) / jasonmoofang@github
#   https://github.com/jasonmoofang/activityfox
# * Leonid Kalichkin / hellishnoob@github
#   https://github.com/hellishnoob/activityfox

pkgname=activityfox-git
_pkgname=activityfox
pkgver=0.2
pkgrel=1
pkgdesc="allow Firefox to play nice with KDE Plasma Activities"
arch=('i686' 'x86_64')
url="https://github.com/temporaryname96/activityfox"
license=('GPL3')
depends=('firefox')
makedepends=('automoc4')
source=("git+${url}.git")
sha256sums=('SKIP')


build() {
 cd $srcdir/${_pkgname}
 cmake .
 make
}

package() {
 cd $srcdir/$_pkgname

 install -D -t ${pkgdir}/usr/bin activityfox activityfox.shell
}
