# Maintainer: Laurentiu Nicola <lnicola@dend.ro>
pkgname=certbot-systemd-nginx
pkgver=1.4
pkgrel=1
pkgdesc="Systemd service for Certbot certificate renewal with nginx servers"
arch=('any')
url="https://github.com/lnicola/certbot-systemd-nginx"
license=('MIT')
depends=('certbot' 'nginx')
replaces=('letsencrypt-systemd-nginx')
install=certbot-systemd-nginx.install
source=("https://github.com/lnicola/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('5edfbaa14792a264634ec375bf95fc160e83c7c7005a84b6af6d16965bb45909')

package() {
    install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/certbot-nginx.service" "${pkgdir}/usr/lib/systemd/system/certbot-nginx.service"
    install -Dm644 "${srcdir}/${pkgname}/certbot-nginx.timer" "${pkgdir}/usr/lib/systemd/system/certbot-nginx.timer"
}
