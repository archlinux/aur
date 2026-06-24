# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=150.0.7871.46
pkgrel=1
pkgdesc="Standalone server that implements the W3C WebDriver standard (for google-chrome-beta)"
arch=('x86_64')
url="https://chromedriver.chromium.org/"
license=('BSD')
depends=(alsa-lib gtk3 libcups libxss libxtst nss xdg-utils)
optdepends=(google-chrome-beta)
provides=(${_pkgname})
conflicts=(chromium ${_pkgname})
source=("${_pkgname}_${pkgver}_linux64.zip::https://storage.googleapis.com/chrome-for-testing-public/${pkgver}/linux64/${_pkgname}-linux64.zip")
sha512sums=('316fe428768a3e1200696dcf7dfb549a5f1570b1ad8a7f162f04c206cba7b7f700df7ccbae00942e328fd3d86c495ee61c6de0d172305ce962075e561efc6c05')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
