# Maintainer: czyt <czytcn@gmail.com>
pkgname=clauge-bin
pkgver=3.2.0
pkgrel=1
pkgdesc="One window. Every dev tool."
arch=('x86_64' 'aarch64')
url="https://clauge.in"
license=('unknown')
depends=('webkit2gtk-4.1' 'gtk3' 'libayatana-appindicator' 'libsecret')
provides=('clauge')
conflicts=('clauge')
source_x86_64=("clauge_${pkgver}_amd64.deb::https://github.com/ansxuman/Clauge/releases/download/v${pkgver}/Clauge_${pkgver}_amd64.deb")
source_aarch64=("clauge_${pkgver}_arm64.deb::https://github.com/ansxuman/Clauge/releases/download/v${pkgver}/Clauge_${pkgver}_arm64.deb")
sha256sums_x86_64=('f5f1a03beaf3c7c6cde8cf1a1c7dfda0db777ab4340fc4d353e29b8d072de615')
sha256sums_aarch64=('8c32246ca7ccaf99eeead9489bc2964f7a704ea476f6f47769dce9cf201117e6')

package() {
    local _debfile
    if [[ "$CARCH" == "x86_64" ]]; then
        _debfile="clauge_${pkgver}_amd64.deb"
    else
        _debfile="clauge_${pkgver}_arm64.deb"
    fi

    ar p "${srcdir}/${_debfile}" data.tar.gz | tar xz -C "${pkgdir}"
    chmod -R u=rwX,go=rX "${pkgdir}"
}
