# Maintainer: ewolnux <thinux@gmx.fr>
pkgname=slimboat
pkgver=1.1.54
pkgrel=1
pkgdesc="Fast,free secure and powerful web browser based on QtWebkit."
arch=('i686' 'x86_64')
url="http://www.slimboat.com/en/dlpage.php"
license=('Freeware')
depends=('libstdc++5' 'openssl>=0.9' 'zlib>=1.1.4' 'libjpeg6-turbo' 'gstreamer0.10-base' 'libpng12')
conflicts=('')
install="${pkgname}.install"

if [ "${CARCH}" = 'x86_64' ]; then
  ARCH='amd64'
  md5sums=('f446d9af73c3bf956848500b60dad489')

elif [ "${CARCH}" = 'amd64' ]; then
  ARCH='i386'
  md5sums=('83ddce57b30ecc155bb4cc1960af5d85')
fi
  source=(http://www.slimboat.com/release/${pkgname}_${ARCH}.deb)

package() {
  ar -x "${srcdir}/${pkgname}_${ARCH}.deb"
  tar -zxf "${srcdir}/data.tar.gz"
  cp -r "${srcdir}/usr/" "${pkgdir}"
  cp -r "${srcdir}/opt/" "${pkgdir}"
}
