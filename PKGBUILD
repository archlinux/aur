# Maintainer: Ben Oliver <ben@bfoliver.com>
pkgname=ttf-pf-agora-sans-pro-git
pkgrel=5
pkgver=r4.1613ca7
pkgdesc="A free font from profont.net"
arch=('any')
url='https://profont.net/family/pf-agora-sans-pro.html'
license=('unknown')
depends=('fontconfig')
makedepends=('git')
conflicts=()
install=$pkgname.install
source=('git+https://gitlab.com/benoliver999/pf-agora-sans-pro.git')
md5sums=('SKIP')

pkgver() {
    cd "pf-agora-sans-pro"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    install -m755 -d "${pkgdir}/usr/share/fonts/ttf-pf-agora-sans-pro"
    install -m644 -t "${pkgdir}/usr/share/fonts/ttf-pf-agora-sans-pro" "${srcdir}"/pf-agora-sans-pro/*.ttf
}
