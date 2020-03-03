# Maintainer: Payson Wallach <payson@paysonwallach.com>

_name=env
pkgname=python-env
pkgver=0.1.2
pkgrel=1
pkgdesc="Mix and match virtual environments."
arch=(any)
url="https://github.com/paysonwallach/env"
license=('BSD-2')
depends=('python')
makedepends=('python-setuptools')
source=("https://github.com/paysonwallach/${_name}/archive/$pkgver.tar.gz")
md5sums=('38e007a644263856e4718b62926d0288')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
