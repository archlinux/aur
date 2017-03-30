# Maintainer: Max Bruckner
pkgname=ssl-fetch
pkgver=0.4
pkgrel=1
pkgdesc="python-ssl-fetch, a dependency of gentoo-mirrorselect."
arch=('any' )
url="https://github.com/dol-sen/ssl-fetch"
license=('GPL2')
depends=('python' 'python-requests' )
makedepends=('git')
source=("git+https://github.com/dol-sen/$pkgname.git#tag=$pkgver")
md5sums=( SKIP )

build() {
    cd "$srcdir/$pkgname"
    sed -i -e "s/Git/$pkgver/g" sslfetch/__init__.py   #Set correct version number
    python setup.py build
}

package() {
    cd "$srcdir/$pkgname"
    python setup.py install --prefix='/usr/' --root="$pkgdir"
}
