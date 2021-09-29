# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pylink
pkgver=0.11.1
pkgrel=1
pkgdesc="Python interface for the SEGGER J-Link"
url="https://github.com/Square/pylink"
depends=('python'
         'python-future'
         'python-psutil'
         'python-setuptools'
         'python-six'
         )
optdepends=()
license=('Apache')
arch=('any')
source=("https://github.com/square/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('ac4280dc46f112678249c7241314a28da66ffb95bc1f1eda0f4881bf80db937a32d34bb2b0433fa998f26f0a8744d7e49d5850da7d062bb3077430e7b437fdce')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

