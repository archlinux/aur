# Maintainer: Nico <desoxhd@gmail.com>
pkgname=anydesk-bin
pkgver=5.5.4
pkgrel=1
pkgdesc="'AnyDesk Free' is an All-In-One Software for Remote Support (Generic based package)"
arch=('i686' 'x86_64')
url="https://anydesk.com"
license=('custom:Freeware')
depends=('fakeroot' 'python-shiboken2' 'gtkglext' 'libglvnd' 'gtk2' 'libx11' 'glibc' 'glib2' 'gdk-pixbuf2' 'libxcb' 'cairo' 'pango' 'libxi' 'libxrandr' 'libxtst' 'libxext' 'libxfixes' 'libxdamage' 'gcc-libs')
optdepends=('libpulse')
conflicts=('anydesk-test' 'anydesk-debian')

source_i686=(https://download.anydesk.com/linux/anydesk-${pkgver}-i386.tar.gz)
source_x86_64=(https://download.anydesk.com/linux/anydesk-${pkgver}-amd64.tar.gz)

sha256sums_i686=('79be3846fc51088bc5461752a6f66dae4bb5b9772c84fdd2cb8ece1b8965ba27')
sha256sums_x86_64=('7a96be4d607b4115999610d324913d57bd7c2fad7137d465276ac157f80fc2e7')

package() {
    install -Dm 755 "${srcdir}/anydesk-${pkgver}/anydesk" "${pkgdir}/usr/bin/anydesk"
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/anydesk.desktop" "${pkgdir}/usr/share/applications/anydesk.desktop"
    msg2 "\e[1;32mAnyDesk has a systemd service for unattended access. Enable it with: systemctl enable --now anydesk \e[0m"
    install -Dm 644 "${srcdir}/anydesk-${pkgver}/systemd/anydesk.service" "${pkgdir}/usr/lib/systemd/system/anydesk.service"
}
