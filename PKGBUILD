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
source_i686=('https://rinnovofirma.infocert.it/download/i686/latest')
source_x86_64=('https://rinnovofirma.infocert.it/download/x86_64/latest')
sha256sums=('c3c0df98ff788b40c31ff4915ebfcbcb71dea389733a71f71e7fe72f145120aa')
sha256sums_i686=('8cdafd635fa965ec90eac8727a8047ab155c57f7cea515d34f6edbc4d7086609')
sha256sums_x86_64=('3e5f868f2b78777b86e19413fff1e2857d74813f901478512d6122eef244ef0b')

package() {
    cd ${srcdir}
    # extracting binaries
    tar -xvf data.tar.xz -C ${pkgdir}
    # installing license
    install -m 755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/licenza-dike6.pdf"
}
