# Maintainer: JP Cimalando <jp-dev@inbox.ru>
# Maintainer: taotieren <admin@taotieren.com>

_name=macholib
pkgbase=python-macholib
pkgname=python-macholib
pkgver=1.16.4
pkgrel=2
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
sha512sums=('3223ceaf9f1c6149caa84434c1478ba65ec4e950b72c3bd9ad09a593c707f7050b2d1d95f36799856dbc410122e810a93a77b00425117aa37bf3cf9a90ca188a')

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
