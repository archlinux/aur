# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=pota-git
pkgver=r16.efb0a12
pkgrel=1
pkgdesc=" Pota programming language "
arch=('any')
url="https://github.com/Delfad0r/pota"
license=('LGPL3')
depends=('python' 'python-setuptools')
provides=('pota')
options=(!emptydirs)
source=("git+https://github.com/Delfad0r/pota.git")
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/pota"
    echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/pota"
    python setup.py install --root="$pkgdir/" --optimize=1
}
