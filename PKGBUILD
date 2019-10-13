# Maintainer: Kevin McCormack <harlemsquirrel@gmail.com>
# https://code.alephobjects.com/w/cura-lulzbot/
pkgname=cura-lulzbot
pkgver=3.6.21
pkgrel=1
pkgdesc='Cura LulzBot Edition for LulzBot 3D Printers by Aleph Objects, Inc.'
arch=('x86_64')
url='https://www.lulzbot.com/cura'
license=('AGPLv3')
source=("http://download.alephobjects.com/ao/aodeb/dists/buster/main/binary-amd64/cura-lulzbot_${pkgver}_amd64.deb")
md5sums=('42f6ee9653f7613df731a3baf6ee4b35')
depends=('gcc8-fortran' 'openssl-1.0')

prepare() {
  # Unpack the tarball containing the 'usr/' directory,
  # where all the essentials reside within the debian package
  tar zxf "${srcdir}/data.tar".gz -C "${srcdir}"
}

package() {
  cp -r "${srcdir}"/usr "${pkgdir}"/usr
}

# Update md5sum
# updpkgsums

## Update .SRCINFO
# makepkg --printsrcinfo | tee .SRCINFO
