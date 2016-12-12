# Maintainer: Sergey Shatunov <me@prok.pw>

pkgname=pg_cron
pkgver=0.1
pkgrel=1
pkgdesc='Run periodic jobs in PostgreSQL directly'
arch=('i686' 'x86_64' 'armv5h' 'armv6h' 'armv7h' 'aarch64')
license=('MIT')
url='https://github.com/citusdata/pg_cron/'
depends=('postgresql-libs')
source=("https://github.com/citusdata/pg_cron/archive/v${pkgver}.tar.gz")
sha512sums=('752e28082946812afac7cf3053d7257ee52b3d84489675b9b6db0d080e1dfffcaf9afbdea930f1f5f07508bcf4d6404d2826dd94375663ad37688ad1aacc424f')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
