# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.2.4'
pkgrel='1'
pkgdesc='Universal CLI file launcher'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.2.4.tar.gz")
sha256sums=('e2150fd3a576fff4bcdb2b8c7f43635e1d84d89de65f6d97a610276cafabc8fb')
#source#=("file:///$MHOME/dev/python/flauncher/dist/flauncher-1.1.8.tar.gz")
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
  install -Dm644 conf/launch.json "$pkgdir/usr/lib/$pkgname/launch.json"
}
