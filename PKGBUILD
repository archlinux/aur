# Maintainer: Your Name <your@email.com>
pkgname=theophany-bin
pkgver=0.1.1
pkgrel=1
pkgdesc="A modern, high-performance game library manager and launcher built with Rust and QML"
arch=('x86_64')
url="https://github.com/oldlamps/Theophany"
license=('GPL-3.0-only')
provides=('theophany')
conflicts=('theophany')
depends=('hicolor-icon-theme') # Ensures the icon system is ready

optdepends=('yt-dlp: for downloading game trailers and media')

source=("theophany::${url}/releases/download/v${pkgver}/theophany_0.1.1_linux_x64"
        "theophany.png::https://github.com/oldlamps/Theophany/raw/refs/heads/main/assets/tray_icon.png"
        "theophany.desktop")

# I've set these to 'SKIP' so you can run 'updpkgsums' to get the fresh hashes for the new files
sha256sums=('7046c46b901aa88442e485d5a4d79208250d7657b875a6aa2ec65a09c7afe033'
            'fd14eb407f45dace71b084e3f7ab523822075058326b1840f366e4da2ca2915e'
            'a494376c3c89672deda9aaa37dc484afddfa4433631a10fb0dfa8dcbd22d06a2')

package() {
    # 1. Install the binary
    install -Dm755 "${srcdir}/theophany" "${pkgdir}/usr/bin/theophany"

    # 2. Install the icon to the standard hicolor theme location
    install -Dm644 "${srcdir}/theophany.png" "${pkgdir}/usr/share/pixmaps/theophany.png"

    # 3. Install the desktop entry
    install -Dm644 "${srcdir}/theophany.desktop" "${pkgdir}/usr/share/applications/theophany.desktop"
}
