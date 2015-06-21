# Maintainer: Benjamin Chretien <chretien at lirmm dot fr>
# Contributor: Alois Belaska <lloyd@centrum.cz>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=fusesmb
pkgver=0.8.7
pkgrel=4
arch=("i686" "x86_64")
license=("GPL")
pkgdesc="SMB for FUSE is a Samba shares filesystem"
url="http://www.ricardis.tudelft.nl/~vincent/fusesmb/"
depends=('fuse' 'smbclient>=4.0')
source=(http://pkgs.fedoraproject.org/repo/pkgs/fuse-smb/${pkgname}-${pkgver}.tar.gz/ff5adc291b18fd452fe4694cbe45dabd/${pkgname}-${pkgver}.tar.gz)
md5sums=('ff5adc291b18fd452fe4694cbe45dabd')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure CFLAGS="-I/usr/include/samba-4.0" --prefix=/usr
  make
}

package()
{
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=${pkgdir} install
}
