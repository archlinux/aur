# Contributor: Andreas Baumann <mail@andreasbauman.cc>
pkgname=dsk2nib-git
_pkgname=dsk2nib
pkgver=r7.ce7a4b8
pkgrel=2
pkgdesc="Apple II DSK-to-NIB and NIB-to-DSK image file conversion utilities."
arch=('x86_64')
url="https://github.com/slotek/dsk2nib"
license=('MIT')
depends=()
optdepends=()
makedepends=()
source=("${_pkgname}::git+https://github.com/slotek/dsk2nib.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"
  install -d -m0755 "$pkgdir/usr/bin"
  cp dsk2nib "$pkgdir/usr/bin/"
  cp nib2dsk "$pkgdir/usr/bin/"
  install -d -m0755 "$pkgdir/usr/share/licenses/$_pkgname/"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
