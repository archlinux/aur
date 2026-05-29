# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=149.0.7827.53
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
sha512sums=('66116b8d3fadd79a95bc9ff790f058e3d17e31d96edba4a7dea37c7cdeb2e930a83d9a47bd8388c242f3094be11442954cfeb14364c3e6b06e3cdc6a46da0e64')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
