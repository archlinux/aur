# Maintainer: pumpkincheshire <sollyonzou@gmail.com>

pkgname="python-amazon.ion"
_name="amazon.ion"
pkgver=0.6.0
pkgrel=1
pkgdesc='A Python implementation of Amazon Ion.'
url='https://amzn.github.io/ion-docs/'
arch=('any')
license=('Apache')
depends=('python-py' 'python-six')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('18a943770e14e09cc93b359b9d59b43f4c9f71a91f8e9065cd32b6fdd978b56c')

build() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$srcdir/$_name-$pkgver"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname"
}
