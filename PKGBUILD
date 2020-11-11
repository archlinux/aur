# Maintainer: neodarz <neodarz at neodarz dot net>

pkgname=silkaj

pkgver=0.8.0
pkgrel=1
pkgdesc="Powerfull, lightweight, and multi-platform command line client written with Python for Duniter’s currencies"

url='https://git.duniter.org/clients/python/silkaj'
arch=('any')
license=('GPL3')

depends=('python' 'python-setuptools' 'python-dephell' 'python-click' 'python-ipaddress' 'python-texttable' 'python-tabulate' 'python-pynacl'
'python-duniterpy' 'python-pypeg2' 'python-pylibscrypt')

source=("https://git.duniter.org/clients/python/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('68a30f03aa8420dbec89fee3aa52bb8d061ef05291516f5873a8d50f5dd7c78dbe5827e41ee710854ebd08a7ddaea572adceaff0a3040134295cb24f6c545b99')

prepare() {
    cd "$pkgname-v$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$pkgname-v$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
