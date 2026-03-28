# Maintainer: wDona <donanferyt@gmail.com>
pkgname=burnt-out-server
pkgver=1.2.06
pkgrel=1
pkgdesc="Server for Burn't Out, a to-do app focused on preventing Burnout Syndrome"
arch=('any')
url="https://github.com/wDona/Burnt-out"
license=('MIT')
depends=('java-runtime')
source=("https://github.com/wDona/Burnt-out/releases/download/v${pkgver}/burnt-out-server-${pkgver}.jar")
sha256sums=('SKIP')

package() {
    mkdir -p "${pkgdir}/opt/burnt-out-server"
    cp "${srcdir}/burnt-out-server-${pkgver}.jar" \
       "${pkgdir}/opt/burnt-out-server/burnt-out-server.jar"

    mkdir -p "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/burnt-out-server" << 'EOF'
#!/bin/sh
exec java -jar /opt/burnt-out-server/burnt-out-server.jar "$@"
EOF
    chmod +x "${pkgdir}/usr/bin/burnt-out-server"
}
