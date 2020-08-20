# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.4.0'
pkgrel='1'
pkgdesc='Universal CLI file launcher'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.4.0.tar.gz")
sha256sums=('13caf5e8483b94746d1c40878c5bc4a81f569915f29547ad9ab186656509351c')
#source#=("file:///$MHOME/dev/python/man/flauncher/dist/flauncher-1.4.0.tar.gz")
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
  install -Dm644 conf/open.json "$pkgdir/usr/lib/$pkgname/open.json"
  install -Dm644 conf/edit.json "$pkgdir/usr/lib/$pkgname/edit.json"
}
