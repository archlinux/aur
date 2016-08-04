# Maintainer: Giulio De Pasquale <me@giugl.io>
pkgname=dike
pkgver=6.4.0
pkgrel=1
pkgdesc="Tool di firma e rinnovo online per i certificati digitali emessi da InfoCert S.p.A."
arch=( 'i686' 'x86_64')
url=""
license=('custom:EULA')
groups=()
install=$pkgname.install
depends=('python2-nautilus' 'libnotify' 'usb_modeswitch' 'pcsclite' 'pcsc-tools' 'gstreamer0.10' 'gstreamer0.10-base' 'libappindicator-gtk3')
source=('https://www.firma.infocert.it/pdf/licenza-dike6.pdf')
source_i686=('https://rinnovofirma.infocert.it/download/i686/latest/Dike6-installer-i686.deb')
source_x86_64=('https://rinnovofirma.infocert.it/download/x86_64/latest/Dike6-installer-x86_64.deb')
sha256sums=('c3c0df98ff788b40c31ff4915ebfcbcb71dea389733a71f71e7fe72f145120aa')
sha256sums_i686=('a697f5ab00a8d4b9ff74196a711ed8bc5efaa1a6ba12a8fec5eabd0c9671fb62')
sha256sums_x86_64=('a7cbd12b9827f01624f6b0391a0f96a904fefb05aa814405ac3dcc608333f4af')

package() {
    cd ${srcdir}
    # extracting binaries
    tar -xvf data.tar.xz -C ${pkgdir}
    # installing license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/licenza-dike6.pdf"
}