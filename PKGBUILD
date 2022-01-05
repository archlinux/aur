# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=silkaj

pkgver=0.8.1
pkgrel=1
pkgdesc="Powerfull, lightweight, and multi-platform command line client written with Python for Duniter’s currencies"

url='https://git.duniter.org/clients/python/silkaj'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-dephell' 'python-click' 'python-ipaddress' 'python-texttable' 'python-tabulate' 'python-pynacl'
'python-duniterpy' 'python-pypeg2' 'python-pylibscrypt')

source=("https://git.duniter.org/clients/python/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('0ced0aa81da2b56f5178de13c2bbd10923acaf2765b5924493b9169ec5080c9dbf1ae419bcb8837955fbfc86c7f4b22d8365b36351101622b196d4009e6231e5')

prepare() {
    cd "$pkgname-v$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$pkgname-v$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
