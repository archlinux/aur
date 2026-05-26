# Maintainer: czyt <czytcn@gmail.com>
pkgname=clauge-bin
pkgver=3.0.1
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
sha256sums_x86_64=('704fa5c61e92de456e9439f6523d6c4e3630c26d1ee7ce944fd5e25b3523b90a')
sha256sums_aarch64=('7173e5f40dec8692696e6ee232ce797ac0702da1453ab0cb0edf97a59ad80685')

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
