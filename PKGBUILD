# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bundled-java
pkgver=5.2.1
pkgrel=1
pkgdesc="Web debugging proxy application (Standalone version using bundled Java)"
arch=('x86_64')
url="https://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'zstd')
conflicts=('charles')
provides=('charles')
replaces=('charles-bin' 'charles-beta-bin')
depends=('hicolor-icon-theme')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy5/charles-proxy5_${pkgver}_amd64.deb)
sha256sums=('6ddf72fe02116a3c86c4a279114ce7b7ec54d28ec6fd7fa4782eb4ca58b78e87')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # stop ^- from appearing in home directory
    sed -i 's/\^-/\/dev\/null/' "${pkgdir}/usr/bin/charles5"
}
