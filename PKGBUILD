# Maintainer: Oliver Jaksch <arch-aur@com-in.de>

pkgname=anydesk
pkgver=2.6.1
pkgrel=2
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support"
arch=('i686' 'x86_64')
url="http://anydesk.de/"
license=('custom:Freeware')
depends=('gtkglext')
optdepends=('libpulse')

source_i686=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_i386.deb)
source_x86_64=(http://download.anydesk.com/linux/${pkgname}_${pkgver}-1_amd64.deb)

sha256sums_i686=('36d8fa8d3dbaf56830d2a9230fe0874543ab595ff5a18cdab9916235fa7b3e2c')
sha256sums_x86_64=('448d4ca9bdd801891c78f4ebd8d24cfbdc79445cb5120b8ea49b52c36a6e9a3e')

package() {
    cd "${pkgdir}"
    tar xf "${srcdir}/data.tar.gz"
    #
    # Remove CRLF from these files as gnome doesn't seem to like this
    sed -i 's/\r$//' etc/xdg/autostart/anydesk.desktop usr/share/applications/anydesk.desktop usr/share/pixmaps/anydesk.xpm
    #
    # If you want to keep the autostart mode, comment next line
    rm -rf etc/
}
