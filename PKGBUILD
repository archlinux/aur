# Maintainer: Jason Go <jasongo@jasongo.net>
# Contributor: Adam Perkowski <adas1per@protonmail.com>
# Contributor: Alois Belaska <lloyd@centrum.cz>
# Contributor: Nathan Owe <ndowens.aur at gmail dot com>

pkgname=fusesmb
pkgver=0.8.7
pkgrel=7
pkgdesc='SMB for FUSE is a Samba shares filesystem'
arch=('x86_64')
url='https://web.archive.org/web/20130503133741/http://www.ricardis.tudelft.nl/~vincent/fusesmb/'
license=('GPL-2.0-only')
depends=('fuse' 'glibc' 'smbclient>=4.0')
optdepends=(
  'smbnetfs: Similar to fusesmb but faster and more secure'
  'smb4k: A KDE gui program that browses samba shares'
)
source=("https://pkgs.fedoraproject.org/repo/pkgs/fuse-smb/$pkgname-$pkgver.tar.gz/ff5adc291b18fd452fe4694cbe45dabd/$pkgname-$pkgver.tar.gz")
md5sums=('ff5adc291b18fd452fe4694cbe45dabd')
b2sums=('f03ffa83845dd30f219e5e0cf355650ca7244231dd690039d06e82394c74e7a6f931708203d7cc8eb4a58c97316c9ed52d3791957df8e568e569d61efd9a8e23')

build() {
  cd ./"$pkgname-$pkgver"
  ./configure CFLAGS="-I/usr/include/samba-4.0" --prefix=/usr
  make
}

package() {
  cd ./"$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
}
