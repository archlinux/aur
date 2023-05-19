# Contributor: Alexander F. Rødseth <xyproto@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=tuxpaint-stamps
pkgver=2023.05.19
pkgrel=1
pkgdesc='Additional stamps for Tux Paint'
arch=('any')
url='https://tuxpaint.org/'
license=('GPL')
optdepends=('tuxpaint')
options=('!strip')
source=("https://downloads.sourceforge.net/tuxpaint/$pkgname-$pkgver.tar.gz")
sha256sums=('21944b6c19133518eeed6b84bde3fdda741ef0aa2a833c4cb1de4fdabdc12244')

build() {
  make -C "$pkgname-$pkgver" PREFIX=/usr
}

package() {
  make -C "$pkgname-$pkgver" DATA_PREFIX="$pkgdir/usr/share/tuxpaint/" install-all
}

# vim: ts=2 sw=2 et:
