# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-beta-bin
pkgver='5.0b9'
pkgrel=1
pkgdesc="Web debugging proxy application (Version 5 Beta)"
arch=('x86_64')
url="https://www.charlesproxy.com"
license=('custom')
makedepends=('tar' 'zstd')
conflicts=('charles')
provides=('charles')
depends=('hicolor-icon-theme' 'java-runtime=17')
source=(https://www.charlesproxy.com/packages/apt/pool/main/c/charles-proxy-beta/charles-proxy-beta_${pkgver}_amd64.deb)
sha256sums=('5182e16b315c4e3e381d68d1470c68f774cdd92c15e38c9c673cf040e009a449')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # included jdk does not work
    # Exception in thread "main" java.lang.UnsatisfiedLinkError: /usr/lib/charles-proxy/jdk/lib/libfontmanager.so: /usr/lib/charles-proxy/jdk/lib/libfontmanager.so: undefined symbol: FcPatternDestroy
    rm -rf usr/lib/charles-proxy/jdk
}
