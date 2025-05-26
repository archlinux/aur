# Maintainer: Louis Tim Larsen <louis(a)louis.dk>
# Contributor: Nagy Roland <roliboy@protonmail.com>

pkgname=chromium-extension-plasma-integration
pkgver=2.0
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
sha256sums=('a6d80899560857d484915045dc05cbfb64285736f28851f1f5d88c75bcc39bab')

package() {
    cd "${srcdir}/plasma-browser-integration-browser-${pkgver}/extension"
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -dr --no-preserve=ownership * "${pkgdir}/usr/share/${pkgname}/"
    jq 'del(.applications)' manifest.json > "${pkgdir}/usr/share/${pkgname}/manifest.json"
}
