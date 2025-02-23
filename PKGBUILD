# Maintainer: Joseph Lansdowne <ikn@ikn.org.uk>
# Contributor: Chris Brannon <cmbrannon79@gmail.com>
# Contributor: Allan McRae <mcrae_allan@hotmail.com>
# Contributor: Philip Nilsson <leffeman@gmail.com>

pkgname=curlftpfs-ng
pkgver=0.9.3
pkgrel=2
pkgdesc="FUSE filesystem for FTP"
url="http://ikn.org.uk/tool/curlftpfs-ng"
license=('GPL-2.0-only')
depends=('curl' 'fuse2' 'glib2')
arch=('x86_64')
source=(http://ikn.org.uk/download/tool/$pkgname/$pkgname-$pkgver.tar.gz)
sha512sums=('17ea2480f9f3e9756d0884db5b0326e66332970674965153f221904f4de93c0154b356c2848fd962f4b5b8e2d10554f5a5b854989b984786825279b6e5dbca28')
conflicts=(curlftpfs)

build () {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package () {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
