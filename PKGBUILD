# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=modfname
pkgver='1.0.4'
pkgrel='1'
pkgdesc='file and folder name modifier on the all system'
arch=('any')
url='https://github.com/yoarch/modfname'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/m/modfname/modfname-1.0.4.tar.gz")
sha256sums=('4bad49db379a4378ac5d7f3a13422d77aead1ec9b67fdf40b92eb264093cce84')
#source#=("file:///$MHOME/dev/python/modfname/dist/modfname-1.0.4.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/$pkgname-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/$pkgname-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
}
