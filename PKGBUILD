pkgname=nginx-user-service
pkgver=1.0.2
pkgrel=1
pkgdesc="Systemd user service for nginx."
arch=('any')
url="https://aur.archlinux.org/packages/${pkgname}"
license=('MIT')
depends=('nginx')
options=('!strip')

source=(
    'nginx.service'
    'nginx-user-service'
)

sha256sums=(
    '8c854b888f02a8beaeefa458b1f4727a3f3529f12e4a113981aa297e8c94794d'
    'fd2b736765448c1728bd4363c7ddf39c66c758abb016217946b41cc2e14c7af4'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" "${srcdir}/${source[0]}"
    install -Dm755 -t "${pkgdir}/usr/lib/systemd/scripts" "${srcdir}/${source[1]}"
}
