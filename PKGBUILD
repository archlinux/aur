# Maintainer: LinArcX <Linarcx at gmail . com>
# Maintainer: Nathan Owens <ndowens @ artixlinux.org>

pkgname=python-pytvmaze
pkgver=2.0.8
pkgrel=4
pkgdesc="Python interface to the TV Maze API "
arch=(any)
url="http://pypi.python.org/pypi/pytvmaze"
license=(MIT)
depends=('python' 'python-requests')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/p/pytvmaze/pytvmaze-${pkgver}.tar.gz"
	"LICENSE::https://raw.githubusercontent.com/srob650/pytvmaze/master/LICENSE.txt")
md5sums=('562f807f97b1c626d9d9ab090195ba7b'
         '891925ddba9bbc84784d4174f72d97e2')

build() {
  cd "$srcdir/pytvmaze-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/pytvmaze-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "$srcdir"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
