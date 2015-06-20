# Maintainer: grimsock <lord.grimsock at gmail dot com>

pkgname=hcraft
pkgver=1.0.0
pkgrel=2
pkgdesc="HTTP Vuln Request Crafter"
arch=('i686' 'x86_64')
url="http://sourceforge.net/projects/hcraft/"
license=('GPL2')
source=("http://downloads.sourceforge.net/project/hcraft/hcraft/hcraft-1.0.0/hcraft-1.0.0.tar.gz")
md5sums=('c426ff53347e12572373da1ea376806c')
sha256sums=('21e12487fb27a61a91451476e306c807e28a0b00a11009bdef0970e34c3d9945')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make hcraft
  strip hcraft
}

package() {
  install -Dm 644 "${srcdir}/${pkgname}-${pkgver}/${pkgname}.modes" "${pkgdir}/etc/${pkgname}.modes"
  install -Dm 755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
