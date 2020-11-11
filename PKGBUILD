# Maintainer: neodarz <neodarz at neodarz dot net>

_pkgname=flake8-eradicate
pkgname=python-$_pkgname

pkgver=1.0.0
pkgrel=1
pkgdesc="Flake8 plugin to find commented out or dead code"

url='https://github.com/sobolevn/flake8-eradicate'
arch=('any')
license=('MIT')

depends=('python' 'python-setuptools' 'python-dephell' 'python-eradicate')

source=("https://github.com/sobolevn/$_pkgname/archive/$pkgver.zip")
sha512sums=('2f83540ec278d9a6b7e72a82358c6bea31986c0d59a67e846e08cbf42a23998d7d8661911fa5e14c85fa839a1d27f65bbe7fef7b96e42113d29e393b76273130')

prepare() {
    cd "$_pkgname-$pkgver"
    dephell deps convert --from pyproject.toml --to setup.py
}

package() {
    cd "$_pkgname-$pkgver"
    python setup.py install --root="$pkgdir" --optimize=1
}
