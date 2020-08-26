# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flakehell
pkgname=python-$_pkgname

pkgver=0.6.0
pkgrel=1
pkgdesc="Flake8 wrapper to make it nice, legacy-friendly, configurable."

url='https://flakehell.readthedocs.io/'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-dephell' 'python-attrs' 'python-entrypoints' 'python-typing-extensions' 'python-termcolor' 'python-flake8-quotes' 'python-pygments' 'python-isort' 'python-pylint' 'python-urllib3' 'flake8' 'python-mccabe' 'python-flake8-commas')

source=("https://github.com/life4/$_pkgname/archive/v.$pkgver.tar.gz")
sha512sums=('5b2274b3ed6bd610db098dce3b6678dd886dfb7c308b688896c282c468ca16abee3b84afbe0998ec83be7291e0f481dc7d4c8d71b028595be4500f13bebdcad7')

prepare() {
    cd "$_pkgname-v.$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-v.$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}

