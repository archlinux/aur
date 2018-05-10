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
_sha256sums_x86_64=('ce578a6d0ef7f2ba279d4a3ba5b191203f159d23419db267a79e4cbf7cb96a7a')
 validpgpkeys=('ABAF11C65A2970B130ABE3C479BE3E4300411886') 

prepare() {
wget https://s3.eu-west-2.amazonaws.com/tradedash/Tradedash-linux.AppImage -O ${pkgname}.AppImage
chmod +x ${pkgname}.AppImage
}
package() {
mkdir -p "${pkgdir}"/usr/{bin,share/applications}
mkdir -p  "${pkgdir}"/usr/share/pixmaps
mkdir -p "${pkgdir}" ~/.local/share/
install -Dm644 ../${pkgname}.desktop ${pkgdir}/usr/share/applications
install -Dm644 ${srcdir}/${pkgname}.AppImage ~/.local/share/${pkgname}
install -Dm644 ../LaunchTradeDash ~/.local/share/LaunchTradeDash
ln -sf ~/.local/share/LaunchTradeDash ${pkgdir}/usr/bin/${pkgname}
chmod +x ~/.local/share/${pkgname}
chmod +x ~/.local/share/LaunchTradeDash
install -Dm644 ../${pkgname}.png ${pkgdir}/usr/share/pixmaps
 
}
