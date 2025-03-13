# Maintainer: Benjamin Hammond <benjaminphammond@gmail.com>
pkgname=org
pkgver=0.0.6
pkgrel=1
pkgdesc="Suckless second brain"
arch=('any')
url="https://github.com/benjaminingreens/org"
license=('MIT')
depends=('python')  # No need to list pip-only dependencies
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')  # Since it's a Git source, we skip the checksum

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
