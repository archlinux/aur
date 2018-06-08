# Maintainer: brent s. <bts[at]square-r00t[dot]net>
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
pkgname=chromedriver-dev
pkgver=2.40
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
sha512sums=('5d4fd5723b6245bb7ee722f0e206391b1baa5f1c558f7e79f54289ea3adab385537f569f84b6de2b4f02e38105416f3361b439349a180e3a764126ed2ad525a4'
            'SKIP')

package() {
  mkdir -p "${pkgdir}/usr/bin/"
  install -D -m 755 "${srcdir}/${_pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
