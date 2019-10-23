# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan Misiak <fijam [at] archlinux.us>

pkgname=gigolo
pkgver=0.5.0
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=('x86_64')
url="https://www.uvena.de/gigolo"
license=('GPL2')
depends=('gvfs')
makedepends=('intltool')
conflicts=('gigolo-git')
source=(https://archive.xfce.org/src/apps/$pkgname/0.5/$pkgname-$pkgver.tar.bz2)
# validpgpkeys=('457990C86F91F33DE05EBF1BCC03633F700990F2') #Enrico Tröger <enrico.troeger@uvena.de>
sha256sums=('97a301aff012a143d0b99e7ecbb27084d3872aa203a74745e8357aab3a1880dc')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
