# $Id: PKGBUILD 113900 2014-07-01 08:10:11Z fyan $
# Maintainer: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>
# Contributor: Paul Mattal <paul@archlinux.org>
# Contributor: Paul Mattal <paul@mattal.com>
# Contributor: Jeremy Sands <cto@jeremysands.com>
# Contributor: Alexander Rødseth <rodseth@gmail.com>

pkgname=nuvexport
pkgver=0.5
pkgrel=3
epoch=2
pkgdesc="Export MythTV .nuv and .mpeg files to other formats"
arch=('any')
url="http://www.mythtv.org/wiki/Nuvexport"
license=('GPL')
depends=('ffmpeg' 'id3lib' 'mplayer' 'mythtv' 'perl-date-manip' 'perl-dbd-mysql'
         'transcode')
backup=('etc/nuvexportrc')
install=$pkgname.install
source=("http://forevermore.net/files/$pkgname/$pkgname-$pkgver-0.20100817.svn.tar.bz2")
sha256sums=('b8138e31786031293dd3cee2dd6554b187b74723836732b8fc727b67a5262995')

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make INSTALL=/bin/install prefix="$pkgdir/usr" sysconfdir="$pkgdir/etc" install
  sed -i "s:/tmp/fifodir:/var/tmp/fifodir:g" "$pkgdir/usr/share/nuvexport/export"/*.pm
}
