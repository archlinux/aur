# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=modfname
pkgver='1.1.4'
pkgrel='1'
pkgdesc='File and folder CLI name modifier on the all system'
arch=('any')
url='https://github.com/yoarch/modfname'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/m/modfname/modfname-1.1.4.tar.gz")
sha256sums=('9082ba017e8944d4db9bc73a45713cb211f6a3b7f7a2958b16ac40577df74acf')
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
