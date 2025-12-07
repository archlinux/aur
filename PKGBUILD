# Maintainer: matthewq337 <matt at mattquintanilla dot xyz>
pkgname=calcure
pkgver=3.2.1
pkgrel=2
pkgdesc='Modern TUI calendar and task manager'
arch=('any')
url=https://github.com/anufrievroman/calcure
license=('MIT')
depends=('python-holidays' 'python-jalali-core' 'python-jdatetime' 'python-icalendar' 'python')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools' )
source=("https://files.pythonhosted.org/packages/source/${pkgname::1}/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('4a7df1107ab17b8db6e268c5d1127daf1ef022c905c912823769734402b4d10b')

build() {
  cd "$pkgname-$pkgver"
  python -m build --wheel --no-isolation
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
   install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
