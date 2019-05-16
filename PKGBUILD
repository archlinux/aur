# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=zipf
pkgver='1.0.2'
pkgrel='1'
pkgdesc='CLI tool to directly zip several files/folders or an existing folder'
arch=('any')
url='https://github.com/yoarch/zipf'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/z/zipfs/zipfs-1.0.2.tar.gz")
sha256sums=('e20f1e8480b534ddf36f531eb778fb8605c459ef74c05362d9998f96f79493d3')
#source#=("file:///$MHOME/dev/python/zipf/dist/zipfs-1.0.2.tar.gz")
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
