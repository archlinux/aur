# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=pjson
pkgver=1.1
pkgrel=2
pkgdesc="Command-line tool to validate and pretty-print JSON and XML"
url="https://github.com/igorgue/pjson"
arch=('any')
license=('MIT')
depends=('python-pygments>=1.6' 'python-xmlformatter')
source=("https://files.pythonhosted.org/packages/source/p/pjson/pjson-$pkgver.tar.gz"
        "$url/raw/master/LICENSE")
sha256sums=('f4fc3c3996551eee3d2fa33e8d29364c7f47f156a1371b48617a12e9153bd6c1'
            'e640161ec133206a5c8a582fd742519d3ea5409bd7b5929d6c978a24da6ad731')

build() {
	cd "pjson-$pkgver"
	python -m setuptools.launch setup.py build
}

package() {
	cd "pjson-$pkgver"
	python -m setuptools.launch setup.py install --root="$pkgdir/" --optimize=1 --skip-build
	install -Dm 644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
