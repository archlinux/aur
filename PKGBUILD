# Maintainer: Nagy Roland <roliboy@protonmail.com>

pkgname=chromium-plasma-integration
pkgver=1.8
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
sha256sums=('855db8dbc33be7e2ec36aa1c7a8b0b832ab6678c6b02739d3f66d4532495a3b8')

package() {
    cd "${srcdir}/plasma-browser-integration-browser-${pkgver}/extension"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}/"
    jq 'del(.applications)' manifest.json > "${pkgdir}/usr/share/${pkgname}/manifest.json"
}
