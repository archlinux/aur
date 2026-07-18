# Maintainer: Selby Mashiki <your-email@example.com>
pkgname=omega-server
pkgver=1.0.0
pkgrel=1
pkgdesc="OmegaOS Server tooling — terminal dashboard and network initializer, standalone for any systemd Linux distro"
arch=('any')
url="https://omega-os.co.zw"
license=('MIT')
depends=('bash' 'procps-ng' 'iproute2' 'coreutils' 'gawk' 'inetutils')
optdepends=('nginx: web server monitoring'
            'openssh: ssh service monitoring'
            'fail2ban: intrusion prevention monitoring'
            'ufw: firewall monitoring'
            'cronie: scheduled task monitoring')
source=("git+https://github.com/Kolgrim33/omega-server.git")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/omega-server"
    install -Dm755 "src/omega-server" "${pkgdir}/usr/bin/omega-server"
    install -Dm755 "src/omega-network-init" "${pkgdir}/usr/bin/omega-network-init"
    install -Dm644 "src/omega-network.service" "${pkgdir}/usr/lib/systemd/system/omega-network.service"
}
