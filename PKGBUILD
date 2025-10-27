# Maintainer: Fergal Moran <fergal.moran@gmail.com>
pkgname=xtreamium-proxy
pkgver=1.4.21
pkgrel=1
pkgdesc="Xtreamium Proxy Service"
arch=('x86_64')
url="https://github.com/xtreamium/xtreamium-proxy"
license=('MIT')
depends=('glibc')
provides=('xtreamium-proxy')
conflicts=('xtreamium-proxy')
backup=('etc/xtreamium-proxy/appsettings.json')
source=("https://github.com/xtreamium/xtreamium-proxy/releases/download/v${pkgver}/xtreamium-proxy-linux.tar.gz")
sha256sums=('SKIP')

package() {
    # Install binary
    install -Dm755 "${srcdir}/xtreamium-proxy" "${pkgdir}/usr/bin/xtreamium-proxy"
    
    # Install configuration
    install -Dm644 "${srcdir}/appsettings.json" "${pkgdir}/etc/xtreamium-proxy/appsettings.json"
    
    # Install systemd service
    install -Dm644 "${srcdir}/xtreamium-proxy.service" "${pkgdir}/usr/lib/systemd/system/xtreamium-proxy.service"
    install -Dm644 "${srcdir}/xtreamium-proxy-user.service" "${pkgdir}/usr/lib/systemd/user/xtreamium-proxy-user.service"
    
    # Install documentation
    install -Dm644 "${srcdir}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

