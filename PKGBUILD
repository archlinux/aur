# Maintainer: Kyle Manna <kyle[at]kylemanna[d0t]com>
pkgname=pylink
pkgver=0.8.1
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
sha512sums=('92e56b69eab7200ea3446593e79a2a4b4dfdba15826aabd03106a7a7cca0c49a040a1d955f666a749df7feef383827dd03ac38a4604573570e87d4b1b2aea458')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    python3 setup.py install --root="$pkgdir" --optimize=1

    install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

