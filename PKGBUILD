
pkgname=hpi
pkgver=1.0.0
pkgrel=2
pkgdesc="Helwan Package Installer for Arch Linux packages"
arch=('x86_64')
url="https://github.com/helwan-linux/hpi"
license=('GPL-3.0-or-later')
depends=('gtk3' 'polkit' 'pacman')
makedepends=('go')
install=hpi.install

source=("git+https://github.com/helwan-linux/hpi.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/hpi"
    go build -o hpi
}

package() {
    cd "$srcdir/hpi"

    install -Dm755 hpi \
        "$pkgdir/usr/bin/hpi"

    install -Dm644 resources/hpi.desktop \
        "$pkgdir/usr/share/applications/hpi.desktop"

    install -Dm644 resources/hpi-mime.xml \
        "$pkgdir/usr/share/mime/packages/hpi.xml"

    install -Dm644 resources/icons/hpi.svg \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/hpi.svg"

    install -Dm644 resources/install_pkg.nemo_action \
        "$pkgdir/usr/share/hpi/install_pkg.nemo_action"
}
