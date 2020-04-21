# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=trashf
pkgver='1.0.3'
pkgrel='1'
pkgdesc='CLI tool to safely remove any file and directory by putting them in the trash'
arch=('any')
url='https://github.com/yoarch/trashf'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/t/trashf/trashf-1.0.3.tar.gz")
sha256sums=('0adb2d9129f753f1f9984a5934755802094ca88d219088c2dc142b7c43ff37dd')
#source#=("file:///$MHOME/dev/python/trashf/dist/trashf-1.0.1.tar.gz")
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
