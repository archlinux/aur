# Maintainer: nyxkn <dev@nyxkn.net>

pkgname=brother-dcp1610w
pkgver=3.0.1
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-1610W and DCP-1612W printers"
arch=('i686' 'x86_64')
url="http://support.brother.com/g/b/producttop.aspx?c=as_ot&lang=en&prod=dcp1610w_eu_as"
license=('GPL2')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=('brscan4: scanner support')
source=(http://download.brother.com/welcome/dlf101535/dcp1610wlpr-3.0.1-1.i386.rpm
        http://download.brother.com/welcome/dlf101534/dcp1610wcupswrapper-3.0.1-1.i386.rpm)
md5sums=('70075f1889548b81096cd944d0bfad76'
         '8dd299667f27afc09f1fa5152669e04f')

package() {
    # cp -r ${srcdir}/etc ${pkgdir}/
    cp -r ${srcdir}/opt ${pkgdir}/
    cp -r ${srcdir}/var ${pkgdir}/

    mkdir -p ${pkgdir}/usr/share/cups/model
    mkdir -p ${pkgdir}/usr/lib/cups/filter
    ln -s /opt/brother/Printers/DCP1610W/cupswrapper/brother-DCP1610W-cups-en.ppd \
        ${pkgdir}/usr/share/cups/model
    ln -s /opt/brother/Printers/DCP1610W/cupswrapper/brother_lpdwrapper_DCP1610W \
        ${pkgdir}/usr/lib/cups/filter
}

