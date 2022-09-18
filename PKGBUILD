# Maintainer: olddog <jeff@impcode.com>
# Contributer: Carsten Feuls <archlinux@carstenfeuls.de>

pkgname=pg_backup_ctl
pkgver=r159.5c5bd4e
pkgrel=1
pkgdesc='A tool to manage PostgreSQL archiving and basebackups'
arch=('any')
url='https://github.com/credativ/pg_backup_ctl'
license=('BSD')
depends=('bash')
makedepends=('git')
source=("${pkgname}::git+https://github.com/credativ/pg_backup_ctl.git")
sha512sums=('SKIP')

pkgver() {
  cd ${srcdir}/${pkgname}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  make install PREFIX=${pkgdir}/usr
}

