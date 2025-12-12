# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Nico <d3sox at protonmail dot com>

_basename=heidisql
pkgname=${_basename}-gtk2-bin
pkgver=12.14.1.1
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, Microsoft SQL and SQLite databases. (GTK2)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0')
conflicts=("${_basename}")
provides=("${_basename}")
replaces=("heidisql-bin")
depends=('gtk2' 'libperconaserverclient' 'mariadb-libs' 'postgresql-libs' 'sqlite' 'freetds')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('71deecca25c2bc2050b7cb721cc5e5333fc523c8e259c463fbb77b1245b014ac')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
