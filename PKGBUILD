# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=calcure
pkgver=3.3
pkgrel=1
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jalali-core' 'python-jdatetime' 'python-icalendar' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('50eba48d351d7767e02c5e1a6ae752c885338a8a8f41df6fe82a318d6211fa2e')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
