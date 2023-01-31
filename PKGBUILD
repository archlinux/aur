# Maintainer: Martin Diehl <aur@martin-diehl.net>

pkgver=0.7.1
pkgrel=2
pkgname=python-scooby
_name=${pkgname#python-}
pkgdesc='A Great Dane turned Python environment detective'
arch=('any')
url='https://github.com/banesullivan/scooby'
license=('MIT')
depends=('python')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('9cbac53dc97de0eb46f4d1cdb7ebc4a7f6a35f2ead234ee8a77aeff728661bfef02971accc8521bcee3de04d9f529e7c02a9664e8de677a5fba1e0256baa490b')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --skip-build --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
