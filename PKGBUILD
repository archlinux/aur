# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=mimi-git
pkgver=60.2758674
pkgrel=1
pkgdesc="best alternative to xdg-open (git version)"
arch=('any')
url="http://github.com/taylorchu/mimi"
license=('GPL2')
depends=('bash' 'dmenu')
makedepends=('git')
conflicts=('xdg-utils')
provides=('xdg-utils')
source=("git://github.com/taylorchu/mimi.git")
md5sums=('SKIP')

_gitroot="mimi"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

