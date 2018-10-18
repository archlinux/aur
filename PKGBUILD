# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=2.43
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
sha512sums=('53d8c7aa350c3cb599fe83ba45be5ff58e9a0871f186dff628a07a3a134b90e3b331bec948652bbf259619179b57a8a89e84afb486060e2591f35f56f221b8b3'
            'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
