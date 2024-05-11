# Maintainer: Mika Cousin <mika dot cousin at gmail dot com>

pkgname=python-sacn
pkgver=1.9.1
pkgrel=1
pkgdesc="sACN / E1.31 module for easy handling of DMX data over ethernet"
arch=(any)
url="https://www.github.com/Hundemeier/sacn"
license=(MIT)
depends=("python" "python-pytest")
makedepends=("python-setuptools")
source=("sacn-$pkgver.tar.gz::https://github.com/Hundemeier/sacn/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=("85d0b95ca307d254a111a22cf57c0737e671173a015b8eaa14cdf79779efd1ca")

check() {
  cd "$srcdir/sacn-$pkgver"
  pytest
}

build() {
  cd "$srcdir/sacn-$pkgver"
  python setup.py build
}

package() {
  cd "$srcdir/sacn-$pkgver"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
