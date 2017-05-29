# Maintainer: Giulio De Pasquale <me@giugl.io>
pkgname=dike
pkgver=6.0
pkgrel=2
pkgdesc="Tool di firma e rinnovo online per i certificati digitali emessi da InfoCert S.p.A."
arch=( 'i686' 'x86_64')
url=""
license=('custom:EULA')
groups=()
install=$pkgname.install
depends=('python2-nautilus' 'libnotify' 'usb_modeswitch' 'pcsclite' 'pcsc-tools' 'gstreamer0.10' 'gstreamer0.10-base' 'libappindicator-gtk2')
source=('https://www.firma.infocert.it/pdf/licenza-dike6.pdf')
source_i686=('https://rinnovofirma.infocert.it/download/i686/latest')
source_x86_64=('https://rinnovofirma.infocert.it/download/x86_64/latest')
sha256sums=('c3c0df98ff788b40c31ff4915ebfcbcb71dea389733a71f71e7fe72f145120aa')
sha256sums_i686=('d99fc97a773580ad240b18efae7d7463ce54f3ff0383240a616e70c90e468cde')
sha256sums_x86_64=('2cb584d0ab5a644f233d83e1df3f4ffd71f5494afba01e0a05cc1e322bf0a35a')

package() {
    cd ${srcdir}
    # extracting binaries
    tar -xvf data.tar.xz -C ${pkgdir}
    # installing license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/licenza-dike6.pdf"
}
