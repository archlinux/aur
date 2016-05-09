# Maintainer: Noel Maersk <veox the wemakethings toad net>
# Contributor: Gergely Tamas <dice the mfa toad kfki toad hu>
# Contributor: Jan Spakula bender02 at archlinux dot us

pkgname=rdup
pkgver=1.1.15
pkgrel=2
pkgdesc="Generates a file list suitable for making backups. Processing tool included."
url="http://archive.miek.nl/projects/rdup"
license=("GPL3")
depends=('glib2' 'pcre' 'libarchive' 'nettle')
makedepends=('automake' 'autoconf')
arch=('i686' 'x86_64')
source=(https://github.com/miekg/$pkgname/archive/$pkgver.tar.gz)
md5sums=('22636438d7cd35f73ddd0a80bf3cf42b')

build() {
  cd $srcdir/$pkgname-$pkgver
  autoreconf -fi
  ./configure --prefix=/usr --sysconfdir=/etc
  make -j1
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}

# vim:set ts=2 sw=2 et:
