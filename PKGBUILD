# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=replace
pkgver='1.1.0'
pkgrel='1'
pkgdesc='Search and replace tool for strings on the all system'
arch=('any')
url='https://github.com/yoarch/replace'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/r/replacefs/replacefs-1.1.0.tar.gz")
sha256sums=('96a8031472bd01c25a678a5ed1ddcd097623800124da9e2db27450dfe6c452d6')
#source#=("file:///$MHOME/dev/python/replacefs/dist/replacefs-1.1.0.tar.gz")
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
