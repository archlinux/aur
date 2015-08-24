# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=x-selection-pipe-git
_gitname=x-selection-pipe
pkgver=r1.4b8c206
pkgrel=1
pkgdesc="A simple clipboard-monitor intended as a data source in shell pipelines"
arch=(any)
url=https://github.com/eigengrau/x-selection-pipe
license=(GPL)
depends=(python-gobject)
makedepends=(git)
provides=(x-selection-pipe)
conflicts=(x-selection-pipe)
source=(git+https://github.com/eigengrau/x-selection-pipe)
md5sums=(SKIP)

pkgver() {
    cd "$_gitname"
    commit=$(git rev-list --count master)
    hash=$(git rev-parse --short HEAD)
    echo "r$commit.$hash"
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
