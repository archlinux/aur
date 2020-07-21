# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.3.1'
pkgrel='1'
pkgdesc='Universal CLI file launcher'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.3.1.tar.gz")
sha256sums=('ca9752e8b924f0b0127d134d064d97a2e2c040c279e33bc2069a214818b5251f')
#source#=("file:///$MHOME/dev/python/man/flauncher/dist/flauncher-1.3.1.tar.gz")
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
