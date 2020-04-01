# Maintainer: Marius Lindvall <(firstname) {cat} varden {dog} info>

pkgname=python-pywebview
pkgver='3.2'
pkgrel=1
pkgdesc="Build GUI for your Python program with JavaScript, HTML, and CSS."
arch=('any')
url='https://github.com/r0x0r/pywebview'
license=('BSD')
depends=('python' 'python-gobject' 'python-cairo' 'gtk3' 'webkit2gtk>=2.22')
makedepends=('python-setuptools')
source=("https://pypi.python.org/packages/source/p/pywebview/pywebview-$pkgver.tar.gz"
	"https://raw.githubusercontent.com/r0x0r/pywebview/master/LICENSE.md")
sha256sums=('8c84e0dca08717b1091d2cbbf8d577fca19900b55c1a95d791380d1c8cc2c0f2'
	'4a988dd3598832cd3653de20dc33cb677d0fb53ab5551c879ca31280ae653675')

build() {
	cd "${srcdir}/pywebview-${pkgver}"
	python setup.py build
}

package() {
	cd "${srcdir}"
	install -Dm 644 "LICENSE.md" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	cd "pywebview-${pkgver}"
	python setup.py install --root="$pkgdir/" --optimize=1 --skip-build
}
