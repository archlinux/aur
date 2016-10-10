# Maintainer: Mark Coolen <mark dot coolen at gmail dot com>
pkgname=python2-mingus
_pkgname=python-mingus
pkgver=0.5.1
pkgrel=1
pkgdesc="a package for Python used by programmers, musicians, composers and researchers 
to make and investigate music."
arch=('any')
url="https://github.com/bspaans/python-mingus"
license=('GPL')
depends=('python2')
optdepends=('lilypond' 'fluidsynth')
source=("https://github.com/bspaans/python-mingus/archive/${pkgver}.tar.gz")
options=(!emptydirs)
md5sums=('95aff384c90f8b06345b67dc922740c9')

package() {
	cd "$srcdir/$_pkgname-$pkgver"
  	python2 setup.py install --root="$pkgdir/" --optimize=1
	cd "$pkgdir/usr"
	mv mingus_examples lib/python2.7/site-packages/mingus/examples
}
