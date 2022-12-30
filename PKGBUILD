# Maintainer: HLFH <gaspard@dhautefeuille.eu>

pkgname=danectl-git
pkgver=0.7.4.r8.gd0f0cc6
pkgrel=1
pkgdesc="DNSSEC DANE implementation manager"
arch=('any')
url="https://github.com/raforg/danectl"
license=('GPL2')
depends=('coreutils' 'sed' 'grep' 'ldns' 'certbot' 'openssl' 'perl' 'openssh' 'gnupg')
makedepends=('git')
optdepends=('bash' 'zsh')
provides=('danectl')
source=("git+https://github.com/raforg/danectl.git")
b2sums=('SKIP')

pkgver() {
    cd danectl/
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/v//;s/-/./g'
}

package() {
    cd danectl/
    install -Dm755 danectl $pkgdir/usr/bin/danectl
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/danectl/LICENSE
}
