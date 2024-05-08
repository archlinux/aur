# Maintainer: Kira Sokolova <Kyra256@proton.me>

pkgname=python-pnglatex
pkgver=1.1
pkgrel=2
pkgdesc="A small program that converts latex snippets to png"
arch=("x86_64")
url="https://pypi.org/project/pnglatex"
license=('GPL-3.0')
_name=${pkgname#python-}
depends=(texlive-basic texlive-binextra netpbm poppler)
makedepends=(python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha256sums=('0995060d4926b6d3b40731586c615234c3e45b3142fc15b836601e3b0cf863d3')

build() {
	cd "$_name-$pkgver"
	python setup.py build
}

package() {
	cd "$_name-$pkgver"
	python setup.py install --optimize=1 --root="${pkgdir}/"
	install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
