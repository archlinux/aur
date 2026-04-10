# Maintainer: Pranav Agarkar <sarthyambal@gmail.com>
pkgname=beamsync-bin
pkgver=2.3
pkgrel=1
pkgdesc="A fast, local peer-to-peer file transfer application with a Neubrutalist interface"
arch=('x86_64')
url="https://github.com/PranavAgarkar07/BeamSync"
license=('MIT')
depends=('webkit2gtk' 'gtk3')
provides=('beamsync')
conflicts=('beamsync')

# Pull directly from our official v2.3 release binary we just uploaded!
source=("https://github.com/PranavAgarkar07/BeamSync/releases/download/v${pkgver}/BeamSync"
        "beamsync.desktop")
sha256sums=('120c3086d89dc28a5d9442f3ba9bc2696f2de6208b9e0256904ae3528d30990d'
            '897fa734e9806ccd7354c72979196f563c55119152999b1b94d03231ee0d96a1')

package() {
    # Install the main executable
    install -Dm755 "${srcdir}/BeamSync" "${pkgdir}/usr/bin/beamsync"
    
    # Install the Desktop file for the App Menu
    install -Dm644 "${srcdir}/beamsync.desktop" "${pkgdir}/usr/share/applications/beamsync.desktop"
    
    # Wails provides the app icon, we could extract it or link it, but for a basic 
    # package, having the executable in /usr/bin/ is the first priority.
}
