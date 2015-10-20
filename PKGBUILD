# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=x-selection-pipe-git
_gitname=x-selection-pipe
pkgver=0.1.0.0.r0.g01e1cb7
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
    git describe --long --tags | \
        sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//;'
}

package() {
    cd "$srcdir/$_gitname"
    python setup.py install --root="$pkgdir/" --optimize=1
}
