# Maintainer mober <maxATmoberDOTat>
# Thanks to:
# * Yuen Hoe (Jason moofang) / jasonmoofang@github
#   https://github.com/jasonmoofang/activityfox

pkgname=activityfox-git
_pkgname=activityfox
pkgver=0.170213
pkgrel=2
pkgdesc="allow Firefox to play nice with KDE Plasma Activities"
arch=('i686' 'x86_64')
url="https://github.com/jasonmoofang/activityfox"
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

 make install -D -t ${pkgdir}/usr/bin activityfox activityfox.shell
}
