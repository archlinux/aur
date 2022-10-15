# Maintainer: Specter119 <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.7.0
pkgrel=1
pkgdesc='A Python framework to work with Lottie files and Telegram animated stickers.'
arch=(any)
url=https://pypi.org/project/lottie
license=(AGPL)
groups=(efb)
depends=(python)
makedepends=(python-setuptools)
optdepends=(
  python-pillow
  python-pypotrace-git
  python-numpy
  python-scipy
  python-cairosvg
  python-fonttools
  python-opencv
  python-grapheme
  python-qscintilla-qt5
  python-coverage
)
replaces=(python-tgs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz)
sha512sums=('dbf032bafe64512a5ce932d0d980e4f9f305573600df8b54f1876f800012ff44d6895b023b6db2e354282900e3456b54df49472d278bae3bd21b549274dceb54')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root $pkgdir --skip-build --optimize=1
	install -Dm644 COPYING $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
