# Maintainer: Specter119 <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.6.10
pkgrel=2
pkgdesc='A Python framework to work with Lottie files and Telegram animated stickers.'
arch=(any)
url=https://pypi.org/project/lottie
license=(AGPL)
groups=(efb)
depends=(python)
makedepends=(python-setuptools)
optdepends=(python-pillow python-pypotrace-git python-numpy python-scipy python-cairosvg python-fonttools python-opencv python-grapheme python-qscintilla-qt5)
replaces=(python-tgs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz
        LICENSE::https://gitlab.com/mattia.basaglia/python-lottie/-/raw/master/COPYING)
sha512sums=('89fd4a4ab7c6678fbb32012dbab3d14cb38d6a3d2f07351d20aeeb49247e99a26e3adf4f9d568c1615e017db56a623c1af950d90e9c0f3feb33c173e6fe9b5b9'
            '8f307fbd1cb056f95ac887a501bb378058bde5a8df9ac6e2dca1f6f492aba91e7d3bddb1b8f6485406d3641150d1a07ea897e5aee9612a673e0627332226fbd5')

build() {
	cd $srcdir/${_name}-$pkgver
	python setup.py build
}

package() {
	cd $srcdir/${_name}-$pkgver
	python setup.py install --root $pkgdir --skip-build --optimize=1
	install -Dm644 $srcdir/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
