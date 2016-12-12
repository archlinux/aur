# Maintainer: Sergey Shatunov <me@prok.pw>

_pkgname=pg_cron
pkgname=${_pkgname}-git
pkgver=v0.1.r8.gd525a61
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL directly'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
source=("git+https://github.com/citusdata/pg_cron.git")
sha512sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
