# Maintainer: koonix <ehsan@disroot.org>
_pkgname='sblock'
pkgname="${_pkgname}-git"
pkgver=r15.53e3f1f
pkgrel=3
pkgdesc="Simple adblocker that creates a hosts file from multiple sources, similar to hblock."
arch=('any')
url='https://github.com/koonix/sblock'
license=('GPL')
depends=('aria2')
makedepends=('git')
source=("git+${url}.git")
md5sums=('SKIP')
conflicts=("$_pkgname")
provides=("$_pkgname")

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$_pkgname"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}
