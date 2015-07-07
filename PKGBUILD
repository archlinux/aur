# Maintainer: mrxx <mrxx at cyberhome dot at>

pkgname=dislocker
pkgver=0.4
pkgrel=1
pkgdesc="Read BitLocker encrypted volumes under Linux"
arch=('i686' 'x86_64')
url="http://www.hsc.fr/ressources/outils/dislocker"
license=('GPL2')
depends=('fuse' 'polarssl')
conflicts=('dislocker-git')
optdepends=('ntfs-3g: NTFS file system support')
source=(https://github.com/Aorimn/dislocker/archive/v$pkgver.tar.gz)
md5sums=('440d4a107d3f4fa56cb8e4ca7b62e645')

build() {
  cd "$pkgname-$pkgver/src"
  make all
}

package() {
  cd "$pkgname-$pkgver/src"
  mkdir -p "$pkgdir/usr/bin" "$pkgdir/usr/lib" "$pkgdir/usr/share/man/man1"
  make DESTDIR="$pkgdir/usr" install
}
