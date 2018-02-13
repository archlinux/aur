# Maintainer: Håvard Pettersson <mail@haavard.me>

_pkgname=python-arch-signoff
pkgname=$_pkgname-git
pkgver=0.1.dev17+g5ee9f14
pkgrel=1
pkgdesc="Sign off Arch Linux test packages"
url="https://github.com/haavard/arch-signoff"
license=("custom:ISC")
arch=("any")

depends=(pyalpm python-click python-dateutil python-requests)
makedepends=(git python-setuptools python-setuptools-scm)
source=("$pkgname::git+https://github.com/haavard/arch-signoff.git")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  python setup.py --version
}

package() {
  cd "$pkgname"
  python setup.py install --root="$pkgdir" --optimize=1
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
