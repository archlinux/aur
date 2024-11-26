# Maintainer: Alex Epelde <alex@epelde.net>
# Contributor: Tim Cassels <cassels2025@gmail.com>

pkgname=brother-hll8360cdw-cups-bin
_printer=hll8360cdw
pkgver=1.5.0
pkgrel=1
pkgdesc="CUPS wrapper for Brother HL-L8360CDW printer"
arch=("i686" "x86_64")
url="http://support.brother.com/g/b/producttop.aspx?c=us&lang=en&prod=hll8360cdw_us_eu_as"
license=("EULA")
groups=("base-devel")
source=("https://download.brother.com/welcome/dlf103246/${_printer}cupswrapper-1.5.0-0.i386.deb")
md5sums=('3eff17863c6e3af61ca52d88aa5d30b4')

package() {
    tar -xf data.tar.gz -C "$pkgdir"

    cd "$pkgdir"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/cups/model/Brother"

    install -Dm644 "opt/brother/Printers/$_printer/cupswrapper/brother_${_printer}_printer_en.ppd" \
        -t "usr/share/ppd/Brother"

    mkdir -p -m755 "$pkgdir/usr/lib/cups/filter"
    ln -s "/opt/brother/Printers/$_printer/cupswrapper/brother_lpdwrapper_$_printer" \
        "usr/lib/cups/filter"

}
