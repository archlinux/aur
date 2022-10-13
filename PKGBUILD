# Maintainer: Castor <whoisYoges at castorisdead dot xyz>
pkgname=rankmirrors
pkgver=r8.e3cab5c
pkgrel=1
pkgdesc="Read a list of mirrors from a file and rank them by speed."
arch=('any')
url="https://github.com/metis-os/metis-rankmirrors"
license=('GPL3')
makedepends=('git')
depends=('bash')
provides=('rankmirrors')
conflicts=('rankmirrors')
options=(!strip !emptydirs)
source=("${pkgname}::git+${url}")
sha256sums=('SKIP')

package() {
    cd "${srcdir}/$pkgname/files"
	install -Dm755 ./rankmirrors "${pkgdir}/usr/bin/rankmirrors"
}

pkgver() {
  cd "${srcdir}/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
