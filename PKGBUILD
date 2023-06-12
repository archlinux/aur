# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=charles-beta-bin
pkgver='5.0b10'
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
sha256sums=('2ddde123c46bec3977cc3c31f9fe37bb28cf75908f2ccab140a5072f040b5b23')

package() {
    cd "${pkgdir}"
    # this extracts all into the pkgdir
    tar xf "${srcdir}/data.tar.zst"
    # included jdk does not work
    # Exception in thread "main" java.lang.UnsatisfiedLinkError: /usr/lib/charles-proxy/jdk/lib/libfontmanager.so: /usr/lib/charles-proxy/jdk/lib/libfontmanager.so: undefined symbol: FcPatternDestroy
    rm -rf usr/lib/charles-proxy/jdk
}
