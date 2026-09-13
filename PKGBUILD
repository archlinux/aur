# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
# Co-Maintainer: Roman Anufriev <anufriev.roman at protonmail dot com>
pkgname=calcure
pkgver=3.4
pkgrel=1
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python' 'python-holidays' 'python-icalendar')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('8789ca5bb14c8018809a58cd50e7be2974e1d1cb0f67fb0af170d1cccb0cfc9d')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
