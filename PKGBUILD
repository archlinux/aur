# Maintainer: ihipop <ihipop@gmail.com>
pkgname=brother-mfc-t800w-bin
pkgver=3.0.2_0
pkgrel=1
pkgdesc="Binary Driver for Brother MFC-T800W printer"
arch=("i686" "x86_64")
url="https://support.brother.com/g/b/downloadlist.aspx?c=us_ot&lang=en&prod=mfct800w_all&os=128#SelectLanguageType-561_0_1"
source=(
"https://download.brother.com/welcome/dlf101982/mfct800wcupswrapper-${pkgver//_/-}.i386.rpm"
"https://download.brother.com/welcome/dlf101983/mfct800wlpr-${pkgver//_/-}.i386.rpm"
)
md5sums=(
"1be57d6c362a3cc2f9ce36dd0591f100"
"1034f2311810b652bd175c869d8f2340"
)
license=('custom:Brother Industries EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
optdepends=(
  'brscan4: Scanner support'
)
_model_=mfct800w
package() {
	mkdir -p -m 755 "${pkgdir}"/usr/share/cups/model
	mkdir -p -m 755 "${pkgdir}"/usr/lib/cups/filter
	cp -r ${srcdir}/opt ${pkgdir}/opt
	ln -s /opt/brother/Printers/${_model_}/cupswrapper/brother_${_model_}_printer_en.ppd "${pkgdir}"/usr/share/cups/model/brother_${_model_}_printer_en.ppd
	ln -s /opt/brother/Printers/${_model_}/lpd/filter${_model_} "${pkgdir}"/usr/lib/cups/filter/brother_lpdwrapper_${_model_}
}

