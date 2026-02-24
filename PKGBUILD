pkgname=ascii-tool
pkgver=0.1.9
pkgrel=1
pkgdesc="A CLI and GUI tool to convert images to ASCII art"
arch=('any')
url="https://github.com/lukaseepydev/ascii-tool/"
license=('MIT')
depends=('python'
         'python-rich'
         'pyside6'
         'python-pillow')
makedepends=('python-build'
             'python-installer'
             'python-wheel')
source=("https://files.pythonhosted.org/packages/source/a/ascii-tool/ascii_tool-$pkgver.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/ascii_tool-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/ascii_tool-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}