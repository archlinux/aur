# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=duniterpy
pkgname=python-$_pkgname

pkgver=0.60.1
pkgrel=1
pkgdesc="Python APIs library to implement Duniter clients software"

url='https://git.duniter.org/clients/python/duniterpy'
arch=('any')
license=('GPL3')

provides=('duniterpy')
depends=('python' 'python-setuptools' 'python-dephell' 'python-aiohttp' 'python-scrypt' 'python-libnacl' 'python-base58' 'attr')

source=("https://git.duniter.org/clients/python/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('3763470ca20d6de94f8516fd33f7fdd4013f7585475cc8e826ab557e7f4fa924dbf090f83465d382e6bf0b08266318367dcb0d7d0540a6c3ac5071440cb88956')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
