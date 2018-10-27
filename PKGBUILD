# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Jan Misiak <fijam [at] archlinux.us>

pkgname=gigolo
pkgver=0.4.90
pkgrel=1
pkgdesc="Frontend to manage connections to remote filesystems using GIO/GVFS"
arch=('i686' 'x86_64')
url="https://www.uvena.de/gigolo"
license=('GPL2')
depends=('gvfs')
makedepends=('intltool')
conflicts=('gigolo-git')
source=(https://archive.xfce.org/src/apps/$pkgname/0.4/$pkgname-$pkgver.tar.bz2)
# validpgpkeys=('457990C86F91F33DE05EBF1BCC03633F700990F2') #Enrico Tröger <enrico.troeger@uvena.de>
sha256sums=('cf45b447bc3c7ff09e590b6a68ec77c87e52df1f0d58708e55ba5732f9f68d4a')

build() {
  cd "${srcdir}"/$pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}"/$pkgname-$pkgver

  make DESTDIR="${pkgdir}" install
}
