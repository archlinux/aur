# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.3.0'
pkgrel='1'
pkgdesc='Universal CLI file launcher'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.3.0.tar.gz")
sha256sums=('767ed48d9f2031f9c325e340a058c99599b421ccb1c4711fbc7cf16b58de4ff1')
#source#=("file:///$MHOME/dev/python/man/flauncher/dist/flauncher-1.3.0.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/${pkgname}-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/${pkgname}-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
  install -Dm644 conf/launch.json "$pkgdir/usr/lib/$pkgname/launch.json"
  install -Dm644 conf/edit.json "$pkgdir/usr/lib/$pkgname/edit.json"
}
