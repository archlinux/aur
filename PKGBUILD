# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=replace
pkgver='1.2.0'
pkgrel='1'
pkgdesc='Search and replace CLI tool for strings on the all system'
arch=('any')
url='https://github.com/yoarch/replace'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/r/replacefs/replacefs-1.2.0.tar.gz")
sha256sums=('4bdab2aa1e5cb4adf874cc9b71f8c2328c4006f66ed0e9775ee2cf7b0dced4ae')
#source#=("file:///$MHOME/dev/python/man/replacefs/dist/replacefs-1.2.0.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/replacefs-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/replacefs-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
}
