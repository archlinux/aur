# Maintainer: George Bereveskos <report@hellas.dev>
pkgname=godash-bin
pkgver=1.0.0
pkgrel=1
pkgdesc="Terminal Personal Productivity Dashboard - Pre-built binary with full calendar functionality"
arch=('x86_64')
url="https://github.com/HellasDev/GoDash"
license=('MIT')
depends=('glibc')
provides=('godash')
conflicts=('godash')
optdepends=(
    'firefox: For better browser integration with calendar links'
    'google-chrome: Alternative browser for calendar integration'
    'chromium: Alternative browser for calendar integration'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/HellasDev/GoDash/releases/download/v${pkgver}-bin/godash-v${pkgver}-linux-amd64.tar.gz")
sha256sums=('26f62ac0967d201ce3c317709a5c86937be0901b3ff3ffae4fb93d25c81bce53')

package() {
    # Install binary
    install -Dm755 godash-linux-amd64 "${pkgdir}/usr/bin/godash"
    
    # Create basic documentation directory
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname%-bin}"
    
    # Add information about the binary package
    cat > "${pkgdir}/usr/share/doc/${pkgname%-bin}/README-binary.txt" << EOF
GoDash Binary Package

This is a pre-built binary of GoDash that includes full Google Calendar 
functionality with embedded OAuth2 credentials.

Features:
- Complete task management with persistent storage
- Markdown notes editor with live preview
- Google Calendar integration (no setup required)
- Real-time weather information
- Beautiful terminal-based interface

The binary is statically linked and should work on most x86_64 Linux systems.

For source code and documentation, visit:
https://github.com/HellasDev/GoDash

To report issues:
https://github.com/HellasDev/GoDash/issues

License: MIT
EOF
}