# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=replace
pkgver='1.0.15'
pkgrel='1'
pkgdesc='Search and replace tool for strings on the all system'
arch=('any')
url='https://github.com/yoarch/replace'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=('https://files.pythonhosted.org/packages/source/r/replacefs/replacefs-1.0.15.tar.gz')
#source#=("file:///$MHOME/dev/python/replacefs/dist/replacefs-1.0.15.tar.gz")
sha256sums=('2dbc1b0450f767b5b038bfe4d99b97a31ffb31f0bc44f0c98d9d87cad1dff5e9')
#sha256sums#=('SKIP')

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
