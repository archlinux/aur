# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2024.01.29
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='https://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('1b0271f6da9a5fb23adb7b494183b9de289a02966d62c4cb430da9b4120594a9')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
