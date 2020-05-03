# Maintainer: Dario Ostuni <another.code.996@gmail.com>
pkgname=python-pampy
pkgver=0.2.1
pkgrel=2
pkgdesc="The Pattern Matching for Python you always dreamed of"
arch=('any')
url="https://github.com/santinic/pampy"
license=('MIT')
depends=('python')
options=(!emptydirs)
#source=("https://github.com/santinic/pampy/archive/v${pkgver}.tar.gz")
source=("pampy-${pkgver}::git+https://github.com/santinic/pampy.git#commit=27de362e63310eaa5044c7c87414d19aacefef56")
sha384sums=('SKIP')

package() {
    cd "$srcdir/pampy-${pkgver}"
    python setup.py install --root="$pkgdir/" --optimize=1
    rm -rf "$pkgdir/usr/lib/python3.8/site-packages/tests"
}
