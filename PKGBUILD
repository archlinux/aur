# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=142.0.7444.23
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
sha512sums=('61ea705f3fff9d0b4f3db60a145164beeaea9ec721db6f1f7c82c98d949cc943b2a613fda17f8c8e2be182466f9fe74487ed56528860e46f92e04fb69a757fb5')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
