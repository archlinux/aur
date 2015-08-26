# Maintainer: ewolnux <thinux@gmx.fr>
pkgname=slimboat-fr
opkgname=download.php?version'='lnx'&'type'='
pkgver=1.1.54
pkgrel=1
pkgdesc="***TESTED*** Rapide, léger, sécurisé et puissant navigateur Web QtWebKit."
arch=('i686' 'x86_64')
url="http://www.slimboat.com/fr/dlpage.php"
license=('Freeware')
depends=('libstdc++5' 'openssl>=0.9' 'zlib>=1.1.4' 'libjpeg6-turbo' 'gstreamer0.10' 'libpng12')
conflicts=('')
install="${pkgname}.install"

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='ubu64' 
  md5sums=('f446d9af73c3bf956848500b60dad489')
else
  ARCH='ubu32'
  md5sums=('83ddce57b30ecc155bb4cc1960af5d85')
fi
  source=(http://www.slimboat.com/${opkgname}${ARCH})

package() {
  ar -x "${srcdir}/${opkgname}${ARCH}"
  tar -zxf "${srcdir}/data.tar.gz"
  cp -r "${srcdir}/./usr/" "${pkgdir}"
  cp -r "${srcdir}/./opt/" "${pkgdir}"
}