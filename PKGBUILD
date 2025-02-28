pkgname=ezflashcli
pkgver=1.0.28
pkgrel=1
pkgdesc="Command line tools to manage flash devices connected to the Dialog Smartbond™ device family"
arch=('any')
url="https://github.com/ezflash/ezFlashCLI"
license=('MIT')
depends=('python' 'python-pyserial')
makedepends=('git' 'python-setuptools')
source=("https://github.com/ezflash/ezFlashCLI/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('c44803939a87bb8a83b5e5bb5f4eb3850076cf0b61b035d83cdd4a69e39a76c3')

build() {
    cd "$srcdir/ezFlashCLI"
    python setup.py build
}

package() {
    cd "$srcdir/ezFlashCLI"
    python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
    install -Dm644 LICENSE.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
