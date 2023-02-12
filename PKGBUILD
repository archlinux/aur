# Maintainer: 0b100100 <0b100100 at protonmail dot ch>

pkgname=orage
pkgver=4.18.0
pkgrel=1
pkgdesc="A simple calendar application with reminders for Xfce"
arch=("i686" "x86_64")
license=('GPL2')
url="https://docs.xfce.org/apps/orage/start"
groups=('xfce4-goodies')
depends=('libxfce4ui' 'libnotify' 'libical')
makedepends=('xfce4-dev-tools')
source=("https://archive.xfce.org/src/apps/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2")
sha512sums=('7760219f64ac3e2ba6d73541a626a0c9411b93268c007f2af5d8080a3a3c0b2a08e00dd96b7794b688aa83c567150c02033b9ba46bf38cd71d3d890e8d1e45ad')

build() {
  cd "$pkgname-$pkgver"
  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib/xfce4 \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
