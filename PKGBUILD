# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=dirsync
pkgver=1.11
origver=1_11
pkgrel=1
pkgdesc="Directory Synchronizer this utility take two argument the source directory and the destination and make recursively the two directories identical"
arch=('i686' 'x86_64')
url="http://www.viara.eu/en/dirsync.htm"
license=('unknown')
source=(http://www.viara.eu/download/$pkgname-$origver.tar.gz)
md5sums=('2eb3745f674fb71047ca4e64110ceb68')

build() {
  cd ${srcdir}

  install -d ${pkgdir}/usr/bin || return 1
  rm $pkgname || return 1

  make linux || return 1
  sed -i 's|/usr/local|/usr/share|g' makefile || return 1
  make DESTDIR=${pkgdir} install || return 1
}

