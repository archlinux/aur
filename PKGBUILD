# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=modfname
pkgver='1.1.5'
pkgrel='1'
pkgdesc='File and folder CLI name modifier on the all system'
arch=('any')
url='https://github.com/yoarch/modfname'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/m/modfname/modfname-1.1.5.tar.gz")
sha256sums=('4d8cbbc19304bf52b50707031f28e59495ff894c175ea141f68bbc2f6f2b8ac2')
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
