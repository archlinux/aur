# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=flauncher
pkgver='1.5.0'
pkgrel='1'
pkgdesc='Universal CLI file launcher'
arch=('any')
url='https://github.com/yoarch/flauncher'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/f/flauncher/flauncher-1.5.0.tar.gz")
sha256sums=('d9bb2e26e01b221a2a530e2c2b42985dbf7c285b9b0c3367260e1f09b712e40f')
#source#=("file:///$MHOME/dev/python/man/flauncher/dist/flauncher-1.4.1.tar.gz")
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
