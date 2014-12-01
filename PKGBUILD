# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: damir <damir@archlinux.org>
# Contributor: Damir Perisa <damir.perisa@bluewin.ch>

pkgname=dirsync
pkgver=1.11
pkgrel=1
pkgdesc="This utility take two directory paths as arguments and makes them recursively identical"
arch=('i686' 'x86_64')
url="http://www.viara.eu/en/dirsync.htm"
license=('unknown')
source=(http://www.viara.eu/download/$pkgname-1_11.tar.gz)
md5sums=('2eb3745f674fb71047ca4e64110ceb68')

prepare() {
  cd "${srcdir}"

  install -d "${pkgdir}"/usr/bin
  rm $pkgname
}

build() {
  cd "${srcdir}"

  make linux
}

package() {
  cd "${srcdir}"

  sed -i 's|/usr/local|/usr/share|g' makefile
  make DESTDIR="${pkgdir}" install
}
