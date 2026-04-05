# Maintainer: aurnaur
pkgname=xscreensaver-tray
pkgver=1.0
pkgrel=3
pkgdesc="System tray toggle for xscreensaver with monitor icon"
arch=('any')
url="https://aur.archlinux.org/packages/xscreensaver-tray"
license=('MIT')
depends=('python' 'python-pyqt6' 'xscreensaver')

# Added files to source so they are tracked correctly
source=("xscreensaver-tray"
        "xscreensaver-tray.desktop"
        "xscreensaver.service")
md5sums=('SKIP' 'SKIP' 'SKIP')

package() {
    # 1. Install the script to /usr/bin
    install -Dm755 "${srcdir}/xscreensaver-tray" "${pkgdir}/usr/bin/xscreensaver-tray"

    # 2. Install the autostart desktop file
    install -Dm644 "${srcdir}/xscreensaver-tray.desktop" "${pkgdir}/etc/xdg/autostart/xscreensaver-tray.desktop"

    # 3. Install the systemd service to the GLOBAL user directory
    install -Dm644 "${srcdir}/xscreensaver.service" "${pkgdir}/usr/lib/systemd/user/xscreensaver.service"
}
