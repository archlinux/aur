pkgname=python312-identify
pkgver=2.6.18
pkgrel=1
pkgdesc='File identification library for Python 3.12'
arch=('any')
url='https://github.com/pre-commit/identify'
license=('MIT')
depends=('python312')
makedepends=('python312-installer')
source=("identify-2.6.18-py2.py3-none-any.whl::https://files.pythonhosted.org/packages/46/33/92ef41c6fad0233e41d3d84ba8e8ad18d1780f1e5d99b3c683e6d7f98b63/identify-2.6.18-py2.py3-none-any.whl")
sha256sums=('8db9d3c8ea9079db92cafb0ebf97abdc09d52e97f4dcf773a2e694048b7cd737')

package() {
  python3.12 -m installer --destdir="$pkgdir" "$srcdir/identify-2.6.18-py2.py3-none-any.whl"
  rm -f "$pkgdir/usr/bin/identify-cli"
  rmdir --ignore-fail-on-non-empty "$pkgdir/usr/bin"
}
