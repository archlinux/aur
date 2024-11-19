# Maintainer: JP Cimalando <jp-dev@inbox.ru>
# Maintainer: taotieren <admin@taotieren.com>

_name=macholib
pkgbase=python-macholib
pkgname=python-macholib
pkgver=1.16.3
pkgrel=4
pkgdesc="Mach-O header analysis and editing"
arch=('any')
url="https://github.com/ronaldoussoren/macholib"
license=('MIT')
depends=('python' 'python-altgraph')
makedepends=(
  python-build
  python-installer
  python-wheel
  python-setuptools)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/$_name/$_name-$pkgver.tar.gz")
sha512sums=('269f8aefe2686cdd22486f6c9d20a2c7034c38984886a1e235ab2285d13e7087286b8ea094704a31105c4a48b9b375a42cb2c65914c95e6a138b203310d17832')

build() {
  cd "macholib-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "macholib-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 644 README.rst "$pkgdir/usr/share/doc/$pkgname/README.rst"
}
