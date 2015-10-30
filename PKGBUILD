# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>
pkgname=git-sh-git
pkgver=20151030.467c388
pkgrel=1
pkgdesc="A customized bash shell suitable for git work."
arch=(any)
url="http://github.com/rtomayko/git-sh/tree/master"
license=('GPL')
depends=(git)
source=("$pkgname::git://github.com/rtomayko/git-sh.git")
md5sums=('SKIP')

pkgver() {
        cd "$pkgname"
        date "+%Y%m%d.$(git describe --always | sed 's/^v//;s/-/./g')"
}

build() {
        cd "$pkgname"
        make
}

package() {
        cd "$pkgname"
        make DESTDIR=$pkgdir PREFIX='$(DESTDIR)/usr/' install
}
