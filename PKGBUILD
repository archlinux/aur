# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bundled-java
pkgver=5.0.3
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
sha256sums=('2dbfd5de3add5b86c94acd937d0c9b265768d5190ef7cf023a9554e4af2ac535')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # stop ^- from appearing in home directory
    sed -i 's/\^-/\/dev\/null/' "${pkgdir}/usr/bin/charles5"
}
