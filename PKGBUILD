# Maintainer: Payson Wallach <payson@paysonwallach.com>

_name=venn
pkgname=$_name
pkgver=0.4.0
pkgrel=1
pkgdesc="Mix and match virtual environments."
arch=(any)
url="https://github.com/paysonwallach/venn"
license=(custom:)
depends=('python' 'python-cleo' 'python-env' 'python-virtualenvwrapper')
makedepends=('python-setuptools')
source=("https://github.com/paysonwallach/venn/releases/download/$pkgver/$_name-$pkgver.tar.gz")
md5sums=('c64679cb229012b6545cfaf6e76af95d')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
