# Maintainer: Kamil Dębski <k.debski@proton.me>

pkgname=brother-hll2442dw-cups-bin
_printer=HLL2442DW
pkgver=4.1.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-L2442DW printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/producttop.aspx?c=pl&lang=pl&prod=hll2442dw_eu"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com//welcome/dlf105959/hll2442dwpdrv-4.1.0-1.i386.deb")
sha256sums=('96a60c3cb4359d25f0da09cbcc137cdf20744a65ac0c1866a4cd5c64639f096a')

package() {
    tar -xf data.tar.gz -C "$pkgdir"
    cd "$pkgdir"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother-${_printer}-cups-en.ppd" \
        -t "usr/share/cups/model/Brother"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother-${_printer}-cups-en.ppd" \
        -t "usr/share/ppd/Brother"

    mkdir -p -m755 "$pkgdir/usr/lib/cups/filter"
    ln -s "/opt/brother/Printers/$_printer/cupswrapper/lpdwrapper" \
        "usr/lib/cups/filter"
}
