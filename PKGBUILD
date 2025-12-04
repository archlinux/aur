pkgname=yxwl-drivers-bin
pkgver=1.2.1
pkgrel=1
pkgdesc="FlashLabel YXWL drivers (binary)"
arch=('x86_64' 'aarch64')
url="https://github.com/KaMeHb-UA/YXWL-driver-bin"

depends=(
    cups
)

source_x86_64=(${url}/releases/download/v${pkgver}/A80_Linux_Driver.tar.gz)
source_aarch64=(${url}/releases/download/v${pkgver}/A80_PI_Driver.tar.gz)
sha256sums_x86_64=('fce641db957b6b2dee4a1be12b5dc1a9074986e227e8e867810f354a390425a1')
sha256sums_aarch64=('cbc713cf7f8d1b0ce89cdf221d0b6132eff91fd23a869fdf8a4a5780edca8021')

package() {
    cd "${srcdir}"/A80_*_Driver
    dirname=`basename $PWD`
    cd -
    mkdir -p "${pkgdir}/usr/lib/cups/filter"
    mkdir -p "${pkgdir}/usr/share/ppd"
    cp -rf "${srcdir}/${dirname}/A80" "${pkgdir}/usr/lib/cups/filter"
    cp -rf "${srcdir}/${dirname}/A80H" "${pkgdir}/usr/lib/cups/filter"
    chmod -R 755 "${pkgdir}/usr/lib/cups/filter/A80"
    chown -R root:root "${pkgdir}/usr/lib/cups/filter/A80"
    chmod -R 755 "${pkgdir}/usr/lib/cups/filter/A80H"
    chown -R root:root "${pkgdir}/usr/lib/cups/filter/A80H"
    cp "${srcdir}/${dirname}/a80hprinter.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/a80printer.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/a81hprinter.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/a81printer.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/c80hprinter.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/c80printer.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/d80printer.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/d80proprinter.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/y8printer.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/y8proprinter.ppd" "${pkgdir}/usr/share/ppd"
    cp "${srcdir}/${dirname}/y80printer.ppd" "${pkgdir}/usr/share/ppd"
}
