# Maintainer: hidekin <hidekin1982@gmail.com>
pkgname=tradedash
pkgver=1.0
pkgrel=1
pkgdesc="A software for trading on Binance and Bittrex"
arch=('x86_64')
url="https://s3.eu-west-2.amazonaws.com/tradedash"
license=('unknown')
noextract=('tradedash-linux.AppImage')
options=('!strip')

_source_x86_64=('https://s3.eu-west-2.amazonaws.com/tradedash/Tradedash-linux.AppImage' )
_md5sums_x86_64=('cc6969838df052e81865ef28b3b526ac')

prepare() {
wget https://s3.eu-west-2.amazonaws.com/tradedash/Tradedash-linux.AppImage -O ${pkgname}.AppImage
chmod +x ${pkgname}.AppImage
}
package() {
mkdir -p "${pkgdir}"/usr/{bin,share/applications}
mkdir -p  "${pkgdir}"/usr/share/pixmaps
install -Dm644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications
cp ${srcdir}/${pkgname}.AppImage ${pkgdir}/usr/bin/${pkgname}
install -Dm644 ../${pkgname}.png ${pkgdir}/usr/share/pixmaps
 
}
