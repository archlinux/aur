# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.35'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'zstd' 'perl' 'postgresql-libs')
source=("${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('ecaf8fc8ec68ac59143a7b4c0c53fded28d1e1396771a9456bb3fdca327e5718')
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
