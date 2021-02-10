# Maintainer:  Ke Liu <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.6.6
pkgrel=1
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
md5sums=(4ce8c83bc3e7f8c9b0a79689ec01c3aa SKIP)

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
