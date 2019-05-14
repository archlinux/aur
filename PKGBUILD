# Maintainer: Andrew Steinke <rkcf@rkcf.me>

pkgname=python-events
_pkgname=events
pkgver=0.3
pkgrel=1
pkgdesc="Python Event Handling the C# Style"
arch=('any')
url="https://github.com/pyeve/events"
license=('BSD')
makedepends=('python-setuptools')
source=("https://github.com/pyeve/$_pkgname/archive/v$pkgver.tar.gz")
md5sums=('dcda689c541697d48169b3f7943763e3')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  python setup.py install --root="$pkgdir/" --skip-build --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim:set ts=2 sw=2 et:
