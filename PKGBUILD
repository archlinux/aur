# Maintainer: Martin Reboredo <yakoyoku@gmail.com>

pkgname=heroic-gogdl
_basever=0.3
pkgver=0.3+r8
pkgrel=2
_commit=bcd4bba34e4e713aeab3e4dbcd6a4d9b34369300
pkgdesc="GOG Downloading module for Heroic Games Launcher"
arch=('any')
url="https://github.com/Heroic-Games-Launcher/heroic-gogdl"
license=('GPL3')
depends=('python-requests')
makedepends=('python-setuptools')
source=("git+$url#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  echo "$_basever+r$(git rev-list --count e80c181..$_commit)"
}

build() {
  cd "$srcdir/$pkgname"
  python setup.py build
}

package() {
  cd "$srcdir/$pkgname"
  python setup.py install --skip-build -O1 --root="$pkgdir/"
}
