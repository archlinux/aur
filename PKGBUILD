# Maintainer: Nathan Wong, NorthWestWind <wsyn148@gmail.com>
_mainver=5
pkgname=firebot
pkgver="${_mainver}.59.1"
pkgrel=1
pkgdesc="A powerful all-in-one bot for Twitch streamers"
arch=('x86_64')
url="https://github.com/crowbartools/Firebot"
license=('GPL3')
source=("${url}/releases/download/v${pkgver}/firebot-v${pkgver}-linux-x64.tar.gz" "firebot.sh")
sha256sums=('d9b90638015add94768c5fa94cc6cb3677c37e16ca0b6bc8207412c87f08780c'
            '7694f96ec45d7b729c01bc9d50a12805a8a040b4e3f8c5fbdccbed57fe10fef6')

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
  cp --no-preserve=mode,ownership "${srcdir}/${pkgname}.sh" "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"
}
