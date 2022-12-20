# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=danectl-git
pkgver=r130.9b1585f
pkgrel=1
pkgdesc="DNSSEC DANE implementation manager"
arch=('any')
url="https://github.com/raforg/danectl"
license=('GPL2')
depends=('bash' 'coreutils' 'sed' 'grep' 'ldns' 'certbot' 'openssl' 'perl' 'openssh' 'gnupg')
makedepends=('git')
provides=('danectl')
source=("git+https://github.com/HLFH/danectl.git")
b2sums=('SKIP')

pkgver() {
    cd danectl/
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd danectl/
    install -Dm755 danectl $pkgdir/usr/bin/danectl
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/danectl/LICENSE
}
