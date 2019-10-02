# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.18'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'perl')
source=("${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('8cacc4d312ccac071487273ea8291000ff9a8c37a3a97c9e0e4a51afa3a74d7a')
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
