pkgname=everydaylinuxusertools
pkgver=1.0
pkgrel=1
pkgdesc="GTK application providing everyday Linux utilities (Bluetooth control)"
arch=('any')
url="https://github.com/everydaylinuxuser/everydaylinuxusertools"
license=('GPL3')
depends=('python' 'python-gobject' 'gtk3' 'polkit')
optdepends=('bluez: Bluetooth support')
source=(
    "https://github.com/everydaylinuxuser/everydaylinuxusertools/releases/download/v1.0/everydaylinuxusertools-1.0.tar.gz"
)
sha256sums=('6b7a59322108276218fc466e47275506732cd9585694fe81ad12e79295d8efa3')

package() {
    # Install Python script
    install -Dm755 "${srcdir}/everydaylinuxusertools.py" "$pkgdir/usr/bin/everydaylinuxusertools"

    # Install desktop file
    install -Dm644 "${srcdir}/everydaylinuxusertools.desktop" "$pkgdir/usr/share/applications/everydaylinuxusertools.desktop"

    # Optional icon
    if [ -f "${srcdir}/icon.png" ]; then
        install -Dm644 "${srcdir}/icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/everydaylinuxusertools.png"
    fi
}