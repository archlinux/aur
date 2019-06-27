# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=modfname
pkgver='1.1.3'
pkgrel='1'
pkgdesc='file and folder name modifier on the all system'
arch=('any')
url='https://github.com/yoarch/modfname'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/m/modfname/modfname-1.1.3.tar.gz")
sha256sums=('77be69aab24027a679fd190930a40eb10694c347f95daaa2edc7468cd55b3d5f')
#source#=("file:///$MHOME/dev/python/modfname/dist/modfname-1.1.3.tar.gz")
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
