# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_mainver=5
pkgname=firebot
pkgver="${_mainver}.58.1"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers"
arch=('x86_64')
repo="North-West-Wind/tradew1nd-standalone"
url="https://github.com/crowbartools/Firebot"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/firebot-v${pkgver}-linux-x64.tar.gz")
sha256sums=('6f1eb7d593874d560098789a4a1be85a3c1915145422c9be7ab2fdfbba6525c2')

prepare() {
  cd $srcdir
  mkdir -p $pkgname
  tar -xf firebot-v${pkgver}-linux-x64.tar.gz -C ${pkgname}
}

package() {
  install -dm755 "${pkgdir}/opt/"
  cp -r --no-preserve=mode,ownership "${srcdir}/${pkgname}" "${pkgdir}/opt/${pkgname}"
	chmod +x "${pkgdir}/opt/${pkgname}/Firebot v${_mainver}"

  install -dm755 "${pkgdir}/usr/bin/"
  cd "${pkgdir}/usr/bin"
  ln -s "../../opt/${pkgname}/Firebot v${_mainver}" "${pkgname}"
}
