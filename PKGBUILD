# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.20'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'perl')
source=("${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('8a3b4e166b34c1ba213143ab502e575ae893f33c0e89b0eb58d45136254c1b4d')
backup=("etc/${pkgname}/${pkgname}.conf")

prepare() {
  cd "${srcdir}/${pkgname}-release-${pkgver}/src"
  ./configure \
    --prefix="/usr"
}

build() {
  cd "${srcdir}/${pkgname}-release-${pkgver}/src"
  make
}

package() {
  cd "${srcdir}/${pkgname}-release-${pkgver}/src"
  make DESTDIR="${pkgdir}" install
}
