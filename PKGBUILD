# $Id: PKGBUILD,v 1.7 2008/12/04 10:51:32 pressh Exp $
# Maintainer: Ronald van Haren <ronald.archlinux.org>
# Contributor: cs-cam - me.at.camdaniel.com
# Contributor: Sebastien Piccand <sebcactus gmail com>

pkgname=asunder
pkgver=1.6.2
pkgrel=1
pkgdesc="Asunder is a graphical CD ripper and encoder"
arch=('i686' 'x86_64')
url="http://littlesvr.ca/asunder/"
license=('GPL2')
depends=('gtk2' 'libcddb')
makedepends=('pkgconfig')
optdepends=('lame: for mp3 support' 'vorbis-tools: for ogg support' \
	'flac: for flac support')
source=(http://littlesvr.ca/asunder/releases/${pkgname}-${pkgver}.tar.bz2)
md5sums=('6e9bd170497cb9cd36a544bd36e9634c')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr
  make || return 1 
  make DESTDIR=${pkgdir} install  || return 1
}
