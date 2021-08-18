# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-proxy_tools
pkgver=0.1.0
pkgrel=1
pkgdesc="Simple proxy implementation for Python"
arch=('any')
url='https://github.com/jtushman/proxy_tools'
license=('BSD')
depends=('python')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/proxy_tools/proxy_tools-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/jtushman/proxy_tools/master/LICENSE.txt")
sha256sums=('ccb3751f529c047e2d8a58440d86b205303cf0fe8146f784d1cbcd94f0a28010'
	'a428fb8a2e762af3eb0a6edbbb88e9b42ccfee80fd9b423958bcacf9b9abbfe4')

build() {
	cd "${srcdir}/proxy_tools-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "proxy_tools-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
