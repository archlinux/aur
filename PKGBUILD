# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=python-pyshortcuts
pkgver=1.7
pkgrel=1
pkgdesc="Create desktop shortcuts to python scripts"
arch=('any')
url="https://github.com/newville/pyshortcuts"
license=('MIT')
depends=('python-six' 'python-wxpython')
makedepends=('python-setuptools')
source=("$pkgname-$pkgver.tar.gz::https://github.com/newville/pyshortcuts/archive/$pkgver.tar.gz"
        'PyShortcut.desktop')
sha256sums=('1bcba867cfef137ca6fbb188aeb4d30ec4747ed1f6278acca1a757e37c3c671f'
            '8087c2ec7b71de9f0a9e7ef963a6f67d83e33271ef0071b1018ee475998380a5')

build() {
	cd "pyshortcuts-$pkgver"
	python setup.py build
}

package() {
	cd "pyshortcuts-$pkgver"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/PyShortcut.desktop" "$pkgdir/usr/share/applications/PyShortcut.desktop"
}
