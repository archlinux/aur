# Maintainer: Raymond Li <aur@raymond.li>
# Contributor: Robert Walaski <robert@walaski.cz>
# Contributor: JunYoung Gwak <aur@jgwak.com>
# Contributor: relrel <relrelbachar@gmail.com>
_pkgname=chromedriver
pkgname=${_pkgname}-beta
pkgver=152.0.7977.13
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
sha512sums=('6959399cd21016ba6c83107feb164a1c1ad6f0b3ca3c03d6877a6f5b69ba67cdfc83c164dee3eaebd131578d7448725d5e8e2c41163e90ea6f5bd4d57a84ac56')

package() {
    install -Dm755 -t "$pkgdir/usr/bin/" "$srcdir/${_pkgname}-linux64/${_pkgname}"
}
