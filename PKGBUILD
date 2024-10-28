# Maintainer: Benjamin Hammond <benjaminphammond@gmail.com>
pkgname=org
pkgver=0.0.5
pkgrel=1
pkgdesc="Suckless second brain"
arch=('any')
url="https://github.com/benjaminingreens/org"
license=('MIT')
depends=('python' 'python-pyyaml' 'python-setuptools')
makedepends=('git')
source=("git+$url#tag=v$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/org"
  python setup.py build
}

package() {
  cd "$srcdir/org"
  python setup.py install --root="$pkgdir/" --optimize=1 --prefix=/usr
}
