# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=trufont
pkgver=0.6.6
pkgrel=5
pkgdesc='A streamlined and hackable font editor'
arch=(any)
url='https://trufont.github.io'
license=(GPL-3.0-only LGPL-3.0-only)
_pydeps=(appdirs
         booleanoperations
         brotli
         compreffor
         cu2qu
         defcon
         fonttools
         fs
         hsluv
         lxml
         pyclipper
         pyqt5
         pyqt5-sip
         pytz
         six
         ufo-extractor
         ufo2ft
         unicodedata2
         zopfli)
depends=(python
         "${_pydeps[@]/#/python-}")
makedepends=(git
             python-{build,installer,wheel}
             python-setuptools-scm)
_archive="$pkgname-$pkgver"
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$_archive.zip")
sha256sums=('0264939bfeb8b9b505f8cdb653faa67332724fadfa46b2b0898fd3c78468cd82')

build() {
	cd "$_archive"
	python -m build -wn
}

package() {
	cd "$_archive"
	python -m installer -d "$pkgdir" dist/*.whl
}
