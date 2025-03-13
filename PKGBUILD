# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-bin
pkgver=5.0
pkgrel=2
pkgdesc="Web debugging proxy application (Standalone version using bundled Java)"
arch=('x86_64')
url="https://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'zstd')
conflicts=('charles')
provides=('charles')
replaces=('charles-beta-bin')
depends=('hicolor-icon-theme')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy5/charles-proxy5_${pkgver}_amd64.deb)
sha256sums=('5408b619d0679e6883dfcdb4f525ae3a47bb8995644f250a48e742c90d01c858')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # stop ^- from appearing in home directory
    sed -i 's/\^-/\/dev\/null/' "${pkgdir}/usr/bin/charles5"
}
