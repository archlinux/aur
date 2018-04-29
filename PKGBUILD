# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=2.38
pkgrel=2
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
sha512sums=('a13be74f58073afe541feee568924d337ca6de24cb4bf75050858d15271e5b7e38b51bc9e44f34a62a341af7ed8236fe17def381bda178c6d235f93495adf32c'
            'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
