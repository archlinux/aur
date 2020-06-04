# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-eradicate
pkgname=python-$_pkgname

pkgver=0.4.0
pkgrel=1
pkgdesc="Flake8 plugin to find commented out or dead code"

url='https://github.com/sobolevn/flake8-eradicate'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-dephell' 'python-eradicate')

source=("https://github.com/sobolevn/$_pkgname/archive/$pkgver.tar.gz")
sha512sums=('6e9907d4e1720c8cb34b684e9fa069ac37027246b53c10d4958f0d173bb18654c65c76fe08716c37bcedcf4e61262bee9b8b0d5b3f74feda987fe707a1c47c7c')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
