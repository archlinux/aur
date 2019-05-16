# Maintainer: Yann Orieult <yo.managements@gmail.com>

pkgname=zipf
pkgver='1.0.4'
pkgrel='1'
pkgdesc='CLI tool to directly zip several files/folders or an existing folder'
arch=('any')
url='https://github.com/yoarch/zipf'
license=('MIT')
depends=('python>=3')
makedepends=('python' 'python-setuptools')

source=("https://files.pythonhosted.org/packages/source/z/zipfs/zipfs-1.0.4.tar.gz")
sha256sums=('472a97123650df7734f6c903aac21e5e87e1657ded3a24a4fb7cbc5c9d709ea0')
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
