# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=trashf
pkgver='1.0.2'
pkgrel='1'
pkgdesc='CLI tool to safely remove any file and directory by putting them in the trash'
arch=('any')
url='https://github.com/yoarch/trashf'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/t/trashf/trashf-1.0.2.tar.gz")
sha256sums=('3fcaf46be43f7da7086e8633de9a9c03a3cada805945f2004e27df962ffdc0bc')
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
