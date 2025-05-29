# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2025.05.26
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=(any)
url='https://tuxpaint.org/'
license=(GPL-2.0-only)
optdepends=(tuxpaint)
options=(!strip)
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('09f4a29f8036c93a64c28134e3afaefb4b9d95a09a71e68fb7537f3c5f82949f')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
