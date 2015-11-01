# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=x-highlight-region-git
_gitname=x-highlight-region
pkgver=0.4.0.0.r0.gc093f24
pkgrel=1
pkgdesc="Dims everything but a selected region of the screen."
arch=(any)
url=https://github.com/eigengrau/x-highlight-region
license=(GPL)
depends=(python-gobject python3-keybinder gtk3 python-cairo python-dbus)
makedepends=(git)
provides=(x-highlight-region)
conflicts=(x-highlight-region)
source=(git+https://github.com/eigengrau/x-highlight-region)
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
