# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2024.10.25
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='https://tuxpaint.org/'
license=('GPL-2.0-only')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('5441a113a57cbf5e00e7a6a4ee75e1daeac3c963b3baac84fea7b168e07876a7')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
