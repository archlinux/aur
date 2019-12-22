# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=80.0.3987.16
pkgrel=1
pkgdesc="Standalone server which implements WebDriver's wire protocol (for google-chrome-dev)"
arch=( 'x86_64' )
url="https://sites.google.com/a/chromium.org/chromedriver/"
license=( 'Apache' )
depends=( 'google-chrome-dev' )
_pkgname=chromedriver
conflicts=( 'chromium-dev' )
install=
changelog=
noextract=()
source=("${_pkgname}-${pkgver}_linux64.zip::https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip"
        "${_pkgname}-${pkgver}_linux64.zip.sig")
sha512sums=('0be386e6412a0a3a79f3528225a80d295abaeba958b5795fde2083d578ce22db4bbd8a6fea762a72a8ee8af46ef72aa5bb66a138ce2c5b9243be4acc2454ebf7'
            'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
