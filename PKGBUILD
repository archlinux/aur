# Maintainer:  Ke Liu <specter119@gmail.com>

pkgname=python-lottie
_name=${pkgname//python-}
pkgver=0.6.3
pkgrel=1
pkgdesc='A Python framework to work with Lottie files and Telegram animated stickers.'
arch=(any)
url=https://pypi.org/project/lottie
license=(AGPL)
groups=(efb)
depends=(python)
makedepends=(python-setuptools)
source=(https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-$pkgver.tar.gz
        LICENSE::https://gitlab.com/mattia.basaglia/python-lottie/-/raw/master/COPYING)
md5sums=('ddac04dd88465b410641cf379c128f50'
         'bf4f3c60e4d121211608f0ad0dbaf67c')

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
