# Maintainer: matt quintanilla <matt @ matt quintanilla . xyz>
pkgname=python-dashtable2
_pkgname=dash-table2
pkgver=1.4.17
_tarname=dashtable2-$pkgver
pkgrel=1
pkgdesc="A library for converting HTML/Markdown/RST tables into ASCII tables and vice versa, rowspan and colspan allowed!"
arch=(any)
url="https://github.com/PasaOpasen/dashtable2"
license=(MIT)
depends=('python-beautifulsoup4' 'python-docutils' 'python-typing_extensions' 'python-numpy')
makedepends=(python-setuptools python-{build,installer,wheel})


source=("$_tarname.tar.gz::$url/archive/$pkgver.zip")
build() {
	cd $_tarname
	python -m build -wn
}

package() {
	cd $_tarname
	install -Dm644 LICENSE.txt -t "$pkgdir/usr/share/licenses/$_pkgname/"
	python -m installer -d "$pkgdir" dist/*.whl
}
sha256sums=('11e793f33856b120f0063dc4549262686e3a8595d9e049ed3242b8aaf8021332')
