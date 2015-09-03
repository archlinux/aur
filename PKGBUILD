# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Contributor: zxalexis <zxalexis@gmail.com>

set -u
pkgname='wipefreespace'
pkgver=2.0
pkgrel=1
pkgdesc='Securely wipe the free space on an ext2/3/4,NTFS, XFS,ReiserFSv3, ReiserFSv4, FAT12/16/32,Minix,JFS and HFS+ partition or drive'
arch=('i686' 'x86_64')
url='http://wipefreespace.sourceforge.net/'
license=('GPL')
source=("http://downloads.sourceforge.net/project/${pkgname}/${pkgname}/${pkgver}/${pkgname}-${pkgver}.tar.gz")
sha256sums=('69bea29c5dba71b774cbfeba1a54dc863bda9f70ecdbab654493e2d0f3d1a0e6')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --prefix='/usr'
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -s -j "$(nproc)"
}

package () {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
set +u
# vim:set ts=2 sw=2 et:
