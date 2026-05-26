# Maintainer: czyt <czytcn@gmail.com>
pkgname=clauge-bin
pkgver=3.0.0
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
sha256sums_x86_64=('d5f45d99e6f60ca125436e799d13b3bc4ca5a8a4a037e19dffc5eb23a825124e')
sha256sums_aarch64=('79fb35f75e14b23981732cf0ef8dcb4e3e78fcfac2bc0504d1a663895dc805ac')

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
