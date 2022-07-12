pkgname=chromium-bypass-paywalls
pkgver=1.8.0
pkgrel=1
pkgdesc='Bypass Paywalls is a web browser extension to help bypass paywalls for selected sites'
arch=('any')
url='https://github.com/iamadamdev/bypass-paywalls-chrome'
license=('unknown')
makedepends=('zip')
optdepends=("chromium: open-source web browser from Google"
            "google-chrome: Google's freeware web browser")
install="${pkgname}.install"
source=("${url}/releases/download/v${pkgver}/bypass-paywalls-chrome.crx")
sha512sums=('81b75a06a3c6e88f5088d18034cd5836a3660ce93a127feb76a2ac9661045760cf394e8b7772dfa2b6bfafbe60dbbff6e08b39d122c0a6bfbfaa160022cdc1d1')

package() {
   mkdir -p "${pkgdir}/usr/share/${pkgname}"
   rm "${srcdir}"/bypass-paywalls-chrome.crx
   cp -dr --no-preserve=ownership "${srcdir}"/* "${pkgdir}/usr/share/${pkgname}/"
}
