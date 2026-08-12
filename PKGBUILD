# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=152.0.7977.42
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
sha512sums=('238447df426730943eb4cf7dcc035fc9c1ac5a98d6aaff10f64dd258b9808c390a6c39807d8a99641d568ca73ecb4d09cb5ecb630eefe0d544a8fa9d2488dd52')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
