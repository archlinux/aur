# Maintainer: czyt <czytcn@gmail.com>
pkgname=clauge-bin
pkgver=3.1.0
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
sha256sums_x86_64=('f534b0cd651ce1036466dbca8a21444069580ca1992af02cda7cf5ed6c5137a2')
sha256sums_aarch64=('bd76bb3e6cb01472837dc2048d6c8cfe4bd56d30fa89bfd25ef08d41eedecf5f')

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
