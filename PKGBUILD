# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-eradicate
pkgname=python-$_pkgname

pkgver=1.2.0
pkgrel=1
pkgdesc="Flake8 plugin to find commented out or dead code"

url='https://github.com/sobolevn/flake8-eradicate'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-dephell' 'python-eradicate')

source=("https://github.com/sobolevn/$_pkgname/archive/$pkgver.zip")
sha512sums=('0fca8d56724369b153ae9483e0a01ef664ae7a561428670b8f3adf0625bd44f5bf8418a41c548538844cbecb8908b3f83129d24b2f498823df046bbf9a7c46d2')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
