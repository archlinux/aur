# Maintainer: Bart Libert <bart plus aur at libert dot email>

pkgname=python-aiolinkding
_name=${pkgname#python-}
pkgver=2023.1.0
pkgrel=1
pkgdesc="async library to the linkding REST API"
arch=('any')
url="https://github.com/bachya/aiolinkding"
license=('MIT')
depends=('python-aiohttp' 'python-packaging' 'python')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=(55acf51b4ab5c30311e2f45fa70c10a028025ba5766418ab2461301f8e20676904657b9b57b9dc6f30964c0b50245477293e8d7792d3e5b4b3d69d41ca996a73)

makedepends=('python-setuptools')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
