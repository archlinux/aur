pkgname="pegasus-harvester"
pkgver="2.3.21"
pkgrel="1"
pkgdesc="Pegasus Harvester by Nanometrics."
arch=('x86_64')
options=('!debug')

source=()
sha256sums=()

prepare() {
    local deb="${startdir}/${pkgname}_${pkgver}_amd64.deb"
    if [[ ! -f "$deb" ]]; then
        error "Missing: ${pkgname}_${pkgver}_amd64.deb"
        msg2 "Download from: https://support.nanometrics.ca/hc/en-us/articles/360042222913-Software-Application-and-Firmware-Downloads-Current-versions#h_01GWAF7DS9FCQ8C6WCJSZXRMAM"
        return 1
    fi
}

package() {
    bsdtar -O -xf "${startdir}/${pkgname}_${pkgver}_amd64.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -
}
