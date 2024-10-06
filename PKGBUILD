# Maintainer: kumax <kumax2048@pm.me>
pkgname=firefox-extension-listen1
pkgver=2.32.0
pkgrel=1
pkgdesc="One for all free music in China"
arch=("any")
url="https://listen1.github.io/listen1"
_githuburl="https://github.com/listen1/listen1_chrome_extension"
_name=${_githuburl##*/}
license=('MIT')
depends=("firefox")
makedepends=("zip")
source=("${_githuburl}/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('e734d834f59f7138b7d3e8b6f4c4bcb2150c8b9ed70345e91e8801d5cc307f43')

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
