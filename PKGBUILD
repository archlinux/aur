# Maintainer: Sebastian Reuße <seb@wirrsal.net>
pkgname=flash-screen-git
_gitname=flash-screen
pkgver=0.1.0.0.r0.g7dcc0ec
pkgrel=1
pkgdesc="Flashes the screen and emits a shutter sound"
arch=(any)
url="https://github.com/eigengrau/flash-screen"
license=(GPL)
depends=(gtk3 gsound python-gobject)
makedepends=(git)
provides=(flash-screen)
conflicts=(flash-screen)
source=(git+https://github.com/eigengrau/flash-screen)
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
