# Maintainer: Castor <whoisYoges at castorisdead dot xyz>
pkgname=rankmirrors
pkgver=3.3.0
pkgrel=1
pkgdesc="Read a list of archlinux mirrors from a file and rank them by speed."
arch=('any')
url="https://github.com/whoisYoges/rankmirrors"
license=('AGPL3')
makedepends=('git')
depends=('bash' 'pacman')
provides=('rankmirrors')
conflicts=('rankmirrors')
options=(!strip !emptydirs)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/$pkgname"
    chmod +x rankmirrors
    install -Dm755 ./rankmirrors "${pkgdir}/usr/bin/rankmirrors"
    install -Dm644 ./rankmirrors.1 "${pkgdir}/usr/share/man/man1/rankmirrors.1.gz"
}

pkgver() {
  cd "${srcdir}/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
