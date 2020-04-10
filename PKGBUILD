# Maintainer:  Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Clarence <xjh.azzbcc@gmail.com>

pkgname=fastoredis
pkgver=2.5.0
pkgrel=1
pkgdesc="FastoRedis (fork of FastoNoSQL) - is a cross-platform open source Redis management tool (i.e. Admin GUI)"
arch=('x86_64')
url="https://fastoredis.com"
license=('GPL-3.0' 'Trial')
depends=('qt5-base' 'python2')
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz::${url}/downloads_pro/linux/${pkgname}_pro-${pkgver}-x86_64.tar.gz")
md5sums=('7310a48c299aa671d1a3762291d4b176')

package() {
  install -Dm644 "${srcdir}"/${pkgname}*/opt/${pkgname}/LICENSE \
   "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
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