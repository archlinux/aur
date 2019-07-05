# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-logicmin
pkgver=0.3.18
pkgrel=1
pkgdesc="Logic Minimization in Python"
arch=('any')
url="https://github.com/dreylago/logicmin"
license=('MIT')
depends=('python' 'python-future')
options=(!emptydirs)
source=("https://github.com/dreylago/logicmin/archive/${pkgver}.tar.gz"
        "001-fix-python2-print.diff")
sha384sums=('5f183125c4ad8376d9b9040d225252cec2e37e438e56a96288b83b4f5f9dad0919bb50f5c571185da5a48fd5012badc9'
            '7a33b00a26c1c165f04b40a61382a9e0a0abd6364ccaf9562ef199cda5c965cac99dc34e27e5ff2e4d0a26215c5634bd')

prepare() {
    cd "$srcdir/logicmin-${pkgver}"
    patch -p1 < "${srcdir}/001-fix-python2-print.diff"
}

package() {
    cd "$srcdir/logicmin-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
}
