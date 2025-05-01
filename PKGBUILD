# Maintainer: Specter119 <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.7.1
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
  python-glaxnimate
  python-numpy
  python-cairosvg
  python-fonttools
  python-opencv
  python-grapheme
  python-qscintilla-qt5
  python-coverage
)
replaces=(python-tgs)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz)
sha512sums=('1857e626105f8e25afd18fb79ede344a66084f9028ca9a625d03a06426d84b986b036cc55e20a8a4b9bd2ea66a610ed65a68822f7a1743c3b787df51edc2588b')

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
