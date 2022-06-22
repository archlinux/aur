# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=python-dotmap
_name=dotmap
pkgver=1.3.30
pkgrel=1
pkgdesc="Ordered, dynamically-expandable dot-access dictionary"
arch=('any')
url="https://github.com/drgrib/dotmap"
license=('MIT')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('5821a7933f075fb47563417c0e92e0b7c031158b4c9a6a7e56163479b658b368')

build() {
    cd "$_name-$pkgver"
    python setup.py build
}

package() {
    cd "$_name-$pkgver"

    python setup.py install --root="$pkgdir" --optimize=1 --skip-build

    install -Dm644 LICENSE.txt "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
