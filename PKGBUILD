# Maintainer: Konstantos Jim <konstantosjim@gmail.com>
pkgname=vbarch-sysctl-network-settings-git
pkgver=r1.0.0
pkgrel=1
pkgdesc="Hardens the Linux network stack via sysctl kernel parameters"
arch=('any')
url="https://gitlab.com/vbarch/sysctl-network-settings"
license=('MIT')
depends=('procps-ng')
makedepends=('git')
conflicts=('vbarch-sysctl-network-settings')
source=("$pkgname::git+https://gitlab.com/vbarch/sysctl-network-settings.git")
sha256sums=('SKIP')

pkgver() {
        cd "$srcdir/$pkgname"
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
        install -Dm644 "${srcdir}/${pkgname}/10-network-hardening.conf" "${pkgdir}/etc/sysctl.d/10-network-hardening.conf"
}
