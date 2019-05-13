# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.1.2'
pkgrel='1'
pkgdesc='universal file launcher for terminal'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.1.2.tar.gz")
sha256sums=('9b28ac4b586c23c478cecbd08ee74f24417344671f032caddc4716f390e18725')
#source#=("file:///$MHOME/dev/python/flauncher/dist/flauncher-1.1.2.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/flauncher-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/flauncher-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
  install -Dm644 conf/default_launchers.json "$pkgdir/usr/lib/$pkgname/default_launchers.json"
}
