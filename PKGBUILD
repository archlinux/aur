# Maintainer: Nico <d3sox at protonmail dot com>

_basename=heidisql
pkgname=${_basename}-qt6-bin
pkgver=12.16
pkgrel=1
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (Qt6)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0-or-later')
conflicts=("${_basename}" heidisql-client)
provides=("${_basename}")
depends=('qt6pas' 'libperconaserverclient' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'freetds')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('89d4ea3685ceab035d40f902eb3594e4a97ff06db08fb52da13f8563b963c4b7')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
