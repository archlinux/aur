# Maintainer: Marco Giannini 
# Contributor:
pkgname=dike
pkgver=20210507
pkgrel=1
pkgdesc="Tool di firma e rinnovo online per i certificati digitali emessi da InfoCert S.p.A."
arch=('x86_64')
url="https://www.infocert.it"
license=('custom:EULA')
groups=()
install=$pkgname.install
depends=('libnotify' 'usb_modeswitch' 'pcsclite' 'pcsc-tools' 'gstreamer' 'libcanberra' 'libxinerama' 'libappindicator-gtk2')
source=('https://www.firma.infocert.it/pdf/licenza-dike6.pdf'
	'https://rinnovofirma.infocert.it/download/x86_64/latest')
sha256sums=('d230fdf28a788fdbea6e9d7f2c7ab48f41c6f218419b8737ee06b34cb477644c'
            '1beb0c04ac5cb4506eca09a17bb757b3b45dc3497e0d9c53c9bd8fb6f409b941')

package() {
    cd ${srcdir}
    # extracting binaries
    tar -xvf data.tar.xz -C ${pkgdir}
    # installing license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/licenza-dike6.pdf"
}
