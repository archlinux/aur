# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=mesasdk
pkgdesc="Software development kit for use with the MESA stellar evolution code"
pkgver=20.3.2
pkgrel=1
epoch=1
arch=('x86_64')
url="http://www.astro.wisc.edu/~townsend/static.php?ref=mesasdk"
provides=('mesasdk')
depends=('binutils' 'make' 'perl' 'libx11' 'zlib' 'tcsh' 'glibc')
install=mesasdk.install
source=("http://www.astro.wisc.edu/~townsend/resource/download/${pkgname}/${pkgname}-x86_64-linux-${pkgver}.tar.gz")
sha1sums=('e49067a6a2cc7a6ee53009ee5004f486c140b6bd')
options=(staticlibs !strip)

package() {
  mkdir -p ${pkgdir}/opt
  tar --extract --file ${pkgname}-x86_64-linux-${pkgver}.tar.gz --directory ${pkgdir}/opt

  # get rid of the old .regen_headers
  rm -f ${pkgdir}/opt/mesasdk/.regen_headers
}
