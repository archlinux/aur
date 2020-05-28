# Maintainer: Mark Coolen <mark dot coolen at gmail dot com>
# Contributer: fkxxyz <fkxxyz@163.com>

pkgname=python-mingus
pkgver=0.6.0
_python_dir_ver=3.8
pkgrel=1
pkgdesc="A package for Python used by programmers, musicians, composers and researchers 
to make and investigate music."
arch=('any')
url="https://github.com/bspaans/python-mingus"
license=('GPL')
depends=('python-six')
optdepends=('lilypond' 'fluidsynth')
source=("https://github.com/bspaans/python-mingus/archive/${pkgver}.tar.gz")
md5sums=('c02c316ffbea978257f5cc6a367e8f1e')

package() {
	cd "$srcdir/$pkgname-$pkgver"
  	python setup.py install --root="$pkgdir/" --optimize=1
	cd "$pkgdir/usr"
	mv mingus_examples lib/python${_python_dir_ver}/site-packages/mingus/examples
}
