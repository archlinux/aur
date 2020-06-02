# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flakehell
pkgname=python-$_pkgname

pkgver=0.5.0
pkgrel=1
pkgdesc="Flake8 wrapper to make it nice, legacy-friendly, configurable."

url='https://flakehell.readthedocs.io/'
arch=('any')
license=('MIT')

provides=('duniterpy')
depends=('python' 'python-setuptools' 'python-dephell')

source=("https://github.com/life4/$_pkgname/archive/v.$pkgver.tar.gz")
sha512sums=('a69f00131c5453e46809bdd1e978348b47c218022f9b3b95db126380cfd05e78261492b99745f364a6883e6401c93d8472554fcb62543536793ecc69f92ab1a1')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

