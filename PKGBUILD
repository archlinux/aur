# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan Misiak <fijam [at] archlinux.us>

pkgname=gigolo
pkgver=0.5.2
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
sha256sums=('e34a1aa0755f9f6c234c7d24b23a6cecd6ef50741d79da3bb6f698a2281dbbc3')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
