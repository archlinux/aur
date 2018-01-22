# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=2.35
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
source=("https://chromedriver.storage.googleapis.com/${pkgver}/${_pkgname}_linux64.zip"
        "${_pkgname}_linux64.zip.sig")
sha512sums=('0da15aee65c7f13552a57cc77212206fcd9a76b3cb912d85807760d6fb44b122e850c72e36fa7f53355c5bfff038afeeec2181089d1507c59cd5e176fd415ae7'
            'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/"
}
