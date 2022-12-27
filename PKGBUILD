# Maintainer: kumax <kumax2048@pm.me>
pkgname=firefox-extension-listen1
pkgver=2.27.0
pkgrel=3
pkgdesc="One for all free music in China"
arch=("any")
url="https://listen1.github.io/listen1"
_githuburl="https://github.com/windmiles/listen1_firefox_extension"
_name=${_githuburl##*/}
license=('MIT')
depends=("firefox")
makedepends=("zip")
source=("${_githuburl}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('0d38d88b61217535a7f5c984fed1667cf41b64b17df06c392214476fcfc8758c')

prepare() {
    cd ${srcdir}/${_name}-${pkgver}
    mv manifest_firefox.json manifest.json
}

build() {
    cd ${srcdir}/${_name}-${pkgver}
    zip -r ${srcdir}/githublisten1@gmail.com.xpi *
}

package() {
    install -Dm644 githublisten1@gmail.com.xpi ${pkgdir}/usr/lib/firefox/browser/extensions/githublisten1@gmail.com.xpi
}
