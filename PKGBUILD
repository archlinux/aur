# Maintainer: czyt <czytcn@gmail.com>
pkgname=clauge-bin
pkgver=3.0.2
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
sha256sums_x86_64=('82efd6f4a6ca2c16a7d3945be4382df012c77c0c4a0a1cb59b169e3e30db6b9e')
sha256sums_aarch64=('6c774df36e501b1380007315091febda9795f24cdd9f6f94f1dcee83e5882c4c')

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
