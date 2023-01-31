pkgname=nginx-user-service
pkgver=1.0.1
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
    '25993f9b740ee77044fbb1a3e9249d983a5611dbc656598d0dc71378339705ba'
    '85633545052a228cdecce73580ac788d003b1c40aba93aef53d1604f20f66520'
)

package() {
    install -Dm644 -t "${pkgdir}/usr/lib/systemd/user" "${srcdir}/${source[0]}"
    install -Dm755 -t "${pkgdir}/usr/lib/systemd/scripts" "${srcdir}/${source[1]}"
}
