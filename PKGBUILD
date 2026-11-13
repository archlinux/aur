# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bundled-java
pkgver=5.2.3
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
sha256sums=('c136b8602a23c6f9011b1add51fda34f689ecd14b682c94c58b6c6a5493b5106')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # stop ^- from appearing in home directory
    sed -i 's/\^-/\/dev\/null/' "${pkgdir}/usr/bin/charles5"
}
