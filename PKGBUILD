# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=duniterpy
pkgname=python-$_pkgname

pkgver=0.57.0
pkgrel=1
pkgdesc="Python APIs library to implement Duniter clients software"

url='https://git.duniter.org/clients/python/duniterpy'
arch=('any')
license=('GPL3')

provides=('duniterpy')
depends=('python' 'python-setuptools' 'python-dephell' 'python-aiohttp' 'python-scrypt' 'python-libnacl' 'python-base58' 'attr')

source=("https://git.duniter.org/clients/python/$_pkgname/-/archive/$pkgver/$_pkgname-$pkgver.tar.gz")
sha512sums=('b646c74413280aca1cf4825ef3b949235651dd34a810aa4b7b0961a1c2b4094501283a8b37012add84fbcfdd1fd5de8d47ea5438eed43689b212fb48e8d6273d')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
