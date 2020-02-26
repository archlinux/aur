# Maintainer: Shalygin Konstantin <k0ste@k0ste.ru>
# Contributor: Shalygin Konstantin <k0ste@k0ste.ru>

pkgname='pgbackrest'
pkgver='2.24'
pkgrel='1'
pkgdesc='Reliable PostgreSQL Backup & Restore'
arch=('x86_64')
url="https://github.com/${pkgname}/${pkgname}"
license=('MIT')
depends=('openssl' 'libxml2' 'icu' 'gcc-libs' 'xz' 'perl')
source=("${url}/archive/release/${pkgver}.tar.gz")
sha256sums=('5ce1b059dee69039a8cfd0bd707394a88e9320a2519f02c09de45cfe85904fdb')
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
