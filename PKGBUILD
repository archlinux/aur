# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=connman_dmenu-git
pkgver=60.0595a14
pkgrel=1
pkgdesc="connman dmenu frontend (git version)"
arch=('any')
url="http://github.com/taylorchu/connman_dmenu"
license=('GPL2')
depends=('bash' 'connman' 'dmenu' 'dnsutils')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/connman_dmenu.git")
md5sums=('SKIP')

_gitroot="connman_dmenu"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

