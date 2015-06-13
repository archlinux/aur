# Maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>

pkgname=git-extensions
pkgver=4
pkgrel=1
pkgdesc="Simple handy extensions for git"
arch=('any')
url="https://github.com/maandree/git-extensions"
license=('custom:GNUAllPermissiveLicense')
depends=('git' 'bash' 'awk')
provides=('git-extensions')
conflicts=('git-extensions')
source=(https://github.com/maandree/git-extensions/tarball/$pkgver)
sha256sums=(6b0718c26567d51e993f15fe24f74bb8af401ecc566e4046ae2dd1ce915c85f3)

build() {
  cd maandree-git-extensions-*
  make -B DESTDIR="$pkgdir/"
}

package() {
  cd maandree-git-extensions-*
  make DESTDIR="$pkgdir/" install
}
