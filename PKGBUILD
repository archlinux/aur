# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.1.1'
pkgrel='1'
pkgdesc='universal file launcher for terminal'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.1.1.tar.gz")
sha256sums=('15e7d96aa4dc9ceee0ae4d55f7c5100d8883643d39853f88a78e87823800cbe4')
#source#=("file:///$MHOME/dev/python/flauncher/dist/flauncher-1.1.1.tar.gz")
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
