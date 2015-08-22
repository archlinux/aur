# Maintainer: tailinchu <use_my_id at gmail dot com>

pkgname=march-overlay-git
pkgver=186.9f5f009
pkgrel=1
pkgdesc="march default system config (git version)"
arch=('any')
url="http://github.com/taylorchu/march-overlay"
license=('GPL2')
depends=('bash' 'expac')
makedepends=('git')
conflicts=()
provides=()
source=("git://github.com/taylorchu/march-overlay.git")
md5sums=('SKIP')

_gitroot="march-overlay"

pkgver () {
    cd "$srcdir/$_gitroot"
    echo "$(git rev-list --count HEAD).$(git describe --always)"
}

package() {
    cd "$srcdir/$_gitroot"
    make PREFIX=/usr DESTDIR="$pkgdir" install
}

