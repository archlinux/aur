# Maintainer: Payson Wallach <payson@paysonwallach.com>

_name=relativetimebuilder
pkgname=python-relativetimebuilder
pkgver=2.0.1
pkgrel=2
pkgdesc="A library for using the dateutil relativedeltas for calendar precision with aniso8601."
arch=('any')
url="https://bitbucket.org/nielsenb/relativetimebuilder"
license=('BSD')
depends=('python' 'python-dateutil' 'python-aniso8601')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
md5sums=('c85d1d2aaaedbf3fb8d0d35cd4baf66d')

build() {
    cd $_name-$pkgver
    python setup.py build
}

package() {
    cd $_name-$pkgver
    python setup.py install --skip-build --root="$pkgdir/" --optimize=1
}
