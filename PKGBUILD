# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=replace
pkgver='1.1.3'
pkgrel='1'
pkgdesc='Search and replace CLI tool for strings on the all system'
arch=('any')
url='https://github.com/yoarch/replace'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/r/replacefs/replacefs-1.1.3.tar.gz")
sha256sums=('a7aebd6c1aeee29953786700af4e23c61e9459ddd0b5dd5f885b0d8191d299cb')
#source#=("file:///$MHOME/dev/python/replacefs/dist/replacefs-1.1.2.tar.gz")
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
