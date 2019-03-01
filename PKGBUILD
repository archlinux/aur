# Maintainer: Geballin - Guillaume Ballin <macniaque at free dot fr>
pkgname=pgbrowse
pkgver=1.9
pkgrel=2
pkgdesc="PgBrowse is a graphical PostgreSQL client. It will allow the user to connect to a PostgreSQL database and execute SQL commands (and much more)."
url="https://github.com/Geballin/PgBrowse"
arch=('x86_64' 'i686')
license=('GPLv3')
depends=('tcl' 'tk' 'tcllib' 'tktable')
optdepends=()
makedepends=(make)
conflicts=()
replaces=()
backup=()
install=
source=("https://github.com/Geballin/PgBrowse/archive/${pkgver}.tar.gz")

md5sums=('d0f919afbc838b116927dbe2dce5c4a1')

build() {
  cd "${srcdir}/PgBrowse-${pkgver}"
  ./configure --prefix=/usr
  make
  }

package() {
  cd "${srcdir}/PgBrowse-${pkgver}"
  make DESTDIR="${pkgdir}" install
  }
