# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=calcure
pkgver=3.2
pkgrel=2
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jalali-core' 'python-jdatetime' 'python-icalendar' 'python-taskw' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('9b2681d28957933b1797b7db8235948e674da9cc57f7285caaabef8fa3fb7367')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
