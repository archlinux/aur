# Original author: Josiah Schwab <jschwab at gmail dot com>
# Maintainer: Josiah Schwab <jschwab at gmail dot com>

pkgname=mesasdk
pkgdesc="Software development kit for use with the MESA stellar evolution code"
pkgver=20190429
pkgrel=2
arch=('x86_64')
url="http://www.astro.wisc.edu/~townsend/static.php?ref=mesasdk"
provides=('mesasdk')
depends=('binutils' 'make' 'perl' 'libx11' 'zlib' 'tcsh' 'glibc')
install=mesasdk.install
source=("http://www.astro.wisc.edu/~townsend/resource/download/${pkgname}/${pkgname}-x86_64-linux-${pkgver}.tar.gz")
sha1sums=('8e71a84036531677f28e321867adf3ef5eb8f6aa')
options=('!strip')

package() {
  mkdir -p ${pkgdir}/opt
  tar --extract --file ${pkgname}-x86_64-linux-${pkgver}.tar.gz --directory ${pkgdir}/opt

  # get rid of the old .regen_headers
  rm -f ${pkgdir}/opt/mesasdk/.regen_headers
}
