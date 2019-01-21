# Maintainer: Lorenzo Nizzi 
# Contributor: Giulio De Pasquale
pkgname=dike
pkgver=6.5.8
pkgrel=1
pkgdesc="Tool di firma e rinnovo online per i certificati digitali emessi da InfoCert S.p.A."
#arch=( 'i686' 'x86_64')
arch=('x86_64')
url="https://www.infocert.it"
license=('custom:EULA')
groups=()
install=$pkgname.install
depends=('libnotify' 'usb_modeswitch' 'pcsclite' 'pcsc-tools' 'gstreamer' 'libcanberra' 'libxinerama' 'libappindicator-gtk2')
source=('https://www.firma.infocert.it/pdf/licenza-dike6.pdf')
#source_i686=('https://rinnovofirma.infocert.it/download/i686/latest')
source_x86_64=('https://rinnovofirma.infocert.it/download/x86_64/latest')
sha256sums=('c3c0df98ff788b40c31ff4915ebfcbcb71dea389733a71f71e7fe72f145120aa')
#sha256sums_i686=('d99fc97a773580ad240b18efae7d7463ce54f3ff0383240a616e70c90e468cde')
sha256sums_x86_64=('f71657ffb5b8d8e943755fbdd2b6cf72f16eeb4d2a18b02be4b7546e0512284c')

package() {
    cd ${srcdir}
    # extracting binaries
    tar -xvf data.tar.xz -C ${pkgdir}
    # installing license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/licenza-dike6.pdf"
}
