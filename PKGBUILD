# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Clarence <xjh.azzbcc@gmail.com>

pkgname=fastoredis
pkgver=2.5.0
pkgrel=1
pkgdesc="A cross-platform open source Redis management tool (i.e. Admin GUI, fork of FastoNoSQL)"
arch=('x86_64')
url="https://fastoredis.com"
license=('GPL3')
depends=('qt5-base' 'python2')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads_pro/linux/${pkgname}_pro-${pkgver}-x86_64.tar.gz")
sha256sums=('74daa5acbd011b0dd165fb5166028655b6e240c003e2ecf47f8d74fe7df6ae6e')

package() {
  install -Dm644 "${srcdir}"/${pkgname}*/opt/${pkgname}/share/applications/${pkgname}.desktop \
   -t "${pkgdir}/usr/share/applications/"
  install -Dm644 "${srcdir}"/${pkgname}*/opt/${pkgname}/share/icons/${pkgname}.png \
   -t "${pkgdir}/usr/share/pixmaps/"
  mv "${srcdir}"/${pkgname}*/opt "${pkgdir}"/
  mkdir -p "${pkgdir}/usr/bin"
  ln -s /opt/${pkgname}/bin/FastoRedis "${pkgdir}/usr/bin/fastoredis"
  rm "${pkgdir}/opt/${pkgname}/LICENSE" 
  rm "${pkgdir}/opt/${pkgname}/share/applications/${pkgname}.desktop"
  rm "${pkgdir}/opt/${pkgname}/share/icons/${pkgname}.png"
}