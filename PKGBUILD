# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=chromium-extension-plasma-integration
pkgver=1.8.0.1
pkgrel=1
pkgdesc='KDE plasma browser integration extension for chromium'
arch=('any')
url='https://github.com/KDE/plasma-browser-integration'
license=('GPL3')
makedepends=(jq)
optdepends=(
    "chromium: open-source web browser from Google"
    "google-chrome: Google's freeware web browser"
    )
source=("https://github.com/KDE/plasma-browser-integration/archive/browser/${pkgver}.tar.gz")
sha256sums=('9e2233a9c329c1939f7e12ab09394d60ce7d90e79b62ebd3d83e249336f596a8')

package() {
    cd "${srcdir}/plasma-browser-integration-browser-${pkgver}/extension"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}/"
    jq 'del(.applications)' manifest.json > "${pkgdir}/usr/share/${pkgname}/manifest.json"
}
