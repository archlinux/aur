# Contributor: tailinchu <use_my_id at gmail dot com>

pkgname=mimi-git
pkgver=66.c9ce958
pkgrel=1
pkgdesc="best alternative to xdg-open (git version)"
arch=('any')
url="http://github.com/taylorchu/mimi"
license=('MIT')
depends=('bash' 'dmenu')
makedepends=('git')
conflicts=('xdg-utils')
provides=('xdg-utils')
source=("git+https://github.com/taylorchu/mimi.git")
md5sums=('SKIP')

_gitroot="mimi"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm 644 LICENSE  "${pkgdir}/usr/share/licenses/mimi"
}

