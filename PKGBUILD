pkgname=microbridge-lmd
pkgver=0.2.0
pkgrel=1
pkgdesc="NDP/CSV to LMD Converter"
arch=('any')
url="https://github.com/Snowman-scott/MicroBridge"
license=('GPL-3.0-or-later')
depends=('python' 'tk' 'python-click' 'python-customtkinter')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://files.pythonhosted.org/packages/fa/f6/784f57b4cd8109626aef76896d5b3725c8c9ce6bd2f402f87142ab8538c3/microbridge_lmd-$pkgver.tar.gz")
sha256sums=('028b0f69bbeece426616d0fde49067b3780fd5a5cbc9b24ad38cfb6ad2824d96')

build() {
  cd "microbridge_lmd-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "microbridge_lmd-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
}
