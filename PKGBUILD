# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=zipf
pkgver='1.0.5'
pkgrel='1'
pkgdesc='CLI tool to directly zip several files/folders or an existing folder'
arch=('any')
url='https://github.com/yoarch/zipf'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/z/zipfs/zipfs-1.0.5.tar.gz")
sha256sums=('fcf7ccac767ccc326e4f4843aa11e0e053dac8946d7f5cc7bedc70bba312c82e')
#source#=("file:///$MHOME/dev/python/zipf/dist/zipfs-1.0.4.tar.gz")
#sha256sums#=("SKIP")

build() {
  cd $srcdir/zipfs-${pkgver}
  python setup.py build
}

package() {
  cd $srcdir/zipfs-${pkgver}

  python setup.py install --root="$pkgdir/"  --optimize=1

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/lib/$pkgname/README.md"
}
