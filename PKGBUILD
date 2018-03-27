# Maintainer: Kevin McCormack <harlemsquirrel@gmail.com>
pkgname=cura2-lulzbot
pkgver=2.6.69
pkgrel=2
pkgdesc='This is the development version of Cura 2 for LulzBot 3D Printers by Aleph Objects, Inc.'
arch=('x86_64')
url='https://code.alephobjects.com'
license=('AGPLv3')
source=("http://download.alephobjects.com/ao/aodeb/dists/stretch/main/binary-amd64/cura-lulzbot_${pkgver}_amd64.deb")
md5sums=('d7fa7ec601981917eb9eaf977949fc55')
depends=('gcc6-fortran')

prepare() {
  # Unpack the tarball containing the 'usr/' directory,
  # where all the essentials reside within the debian package
  tar zxf "${srcdir}/data.tar".gz -C "${srcdir}"

  sed -i 's;LD_LIBRARY_PATH=;LD_LIBRARY_PATH=/usr/lib/gcc/x86_64-pc-linux-gnu/6.4.1:;' "${srcdir}/usr/bin/cura-lulzbot"
}

package() {
  cp -r "${srcdir}"/usr "${pkgdir}"/usr
}
