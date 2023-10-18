# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_pkgname=tradew1nd-standalone
pkgname=$_pkgname-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="Standalone desktop app of TradeW1nd the Discord music bot."
arch=('x86_64')
repo="North-West-Wind/tradew1nd-standalone"
url="https://github.com/${repo}"
license=('GPL3')
makedepends=('unzip')
source=("${url}/releases/download/v${pkgver}/tradew1nd-standalone-linux-x64-${pkgver}.zip" "https://raw.githubusercontent.com/${repo}/v${pkgver}/public/images/tradew1nd-win.png" "tradew1nd.desktop")
md5sums=('6de2b02de315a65072a6034af29fa02b'
         '79678799c823191d022e248ff4bc6728'
         '8b4e1d18388868e02d068e32f11cf385')

prepare() {
  cd $srcdir

	unzip -o tradew1nd-standalone-linux-x64-$pkgver.zip
}

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/${_pkgname}-linux-x64" "${pkgdir}/opt/${_pkgname}"
	chmod +x "${pkgdir}/opt/${_pkgname}/${_pkgname}"

  install -dm755 "${pkgdir}/usr/share/icons/"
	cp --no-preserve=mode,ownership "${srcdir}/tradew1nd-win.png" "${pkgdir}/usr/share/icons/tradew1nd.png"

  install -dm755 "${pkgdir}/usr/share/applications/"
	cp --no-preserve=mode,ownership "${srcdir}/tradew1nd.desktop" "${pkgdir}/usr/share/applications/tradew1nd.desktop"
}
