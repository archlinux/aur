# Maintainer: Storm Dragon <storm_dragon@linux-a11y.org>
pkgname=ninjam-client
pkgver=r3657.658f12f1
pkgrel=1
pkgdesc="A program to allow people to make real music together via the Internet; ncurses client side utility"
arch=('aarch64' 'armv7h' 'x86_64')
url="http://www.ninjam.com/"
license=('GPL')
depends=('ncurses' 'alsa-lib' 'libvorbis')
makedepends=('gcc' 'git' 'jack')
source=("git+https://www-dev.cockos.com/ninjam/ninjam.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/ninjam/ninjam/cursesclient"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
 
build() {
  cd "${srcdir}/ninjam/ninjam/cursesclient"
  make || return 1
}

package() {
  cd "${srcdir}/ninjam/ninjam/cursesclient"
  install -D -m755 cninjam $pkgdir/usr/bin/cninjam
}
