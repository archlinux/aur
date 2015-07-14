# Maintainer: Guten Ye

pkgname="bups"
pkgver=0.5.0
pkgrel=2
pkgdesc="Simple GUI for Bup, a very efficient backup system."
arch=("any")
url="https://github.com/emersion/bups"
license=("MIT")
depends=("bup" "pygtk" "cifs-utils")
makedepends=()
source=(
  "https://github.com/emersion/bups/archive/v$pkgver.tar.gz")
md5sums=('348d5717902c67a36d0fc0b66736e186')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  bash tools/makemo.sh
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 setup.py install --root="$pkgdir/" --optimize=1
}

# vim:set ts=2 sw=2 et:
