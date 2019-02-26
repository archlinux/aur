# Maintainer: nyxkn <nyxkn [at] yahoo [dot] com>
# Maintainer: FeLiX LiM <linxinjie1839 [at] gmail [dot] com>
pkgname=brother-dcp1618w
pkgver=1.0.0
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-1618W printers"
arch=('i686' 'x86_64')
url="https://support.brother.com/g/b/producttop.aspx?c=cn&lang=zh&prod=dcp1618w_cn"
license=('GPL2')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')
source=(https://download.brother.com/welcome/dlf101854/dcp1618wlpr-3.0.1-1.i386.rpm
        https://download.brother.com/welcome/dlf101855/dcp1618wcupswrapper-3.0.1-1.i386.rpm)
md5sums=('822191dc29c82f46fab08c90fb513cbd'
         'eed9c36d912f27877fab7f674fe59f48')

package() {
    # cp -r ${srcdir}/etc ${pkgdir}/
    cp -r ${srcdir}/opt ${pkgdir}/
    cp -r ${srcdir}/var ${pkgdir}/

    mkdir -p ${pkgdir}/usr/share/cups/model
    mkdir -p ${pkgdir}/usr/lib/cups/filter
    ln -s /opt/brother/Printers/DCP1618W/cupswrapper/brother-DCP1618W-cups-en.ppd \
        ${pkgdir}/usr/share/cups/model
    ln -s /opt/brother/Printers/DCP1618W/cupswrapper/brother_lpdwrapper_DCP1618W \
        ${pkgdir}/usr/lib/cups/filter
}
