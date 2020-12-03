# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.7.0
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion.'
url='https://amzn.github.io/ion-docs/'
arch=('any')
license=('Apache')
depends=('python-py' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4b5f7af82508eac9952eea48b6745c85a5b9e6b1dd6ebeb72eee4f8ed4847364')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
