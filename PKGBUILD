# Maintainer: Nico <d3sox at protonmail dot com>

_basename=heidisql
pkgname=${_basename}-qt6-bin
pkgver=12.22
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (Qt6)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0-or-later')
conflicts=("${_basename}" heidisql-client)
provides=("${_basename}")
depends=('qt6pas' 'mariadb-clients' 'postgresql-libs' 'sqlite' 'freetds')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('d4519c1576b12ef9a5e7d524cf5a430289a8b0e1f75ee5876228dc887e5e2e15')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
