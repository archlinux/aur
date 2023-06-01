# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname='python-memoization'
_name=${pkgname#python-}
pkgver=0.4.0
pkgrel=1
pkgdesc='A powerful caching library for Python, with TTL support and multiple algorithm options'
arch=('any')
url='https://github.com/lonelyenvoy/python-memoization'
license=('MIT')
makedepends=('python-setuptools')

source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('c9e481e34a6cda01af75043cfbd1dff98870b4e390b88d6d10e7d51015d223a41a5da5591bea11d45a2918b4870b81d9ae3f0b0b64dc08d54e6b1dd7e4345c4e')


build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
