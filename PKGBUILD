# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Nico <d3sox at protonmail dot com>

_basename=heidisql
pkgname=${_basename}-gtk2-bin
pkgver=12.13.1.1
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and SQLite databases. (GTK2)"
arch=('x86_64')
_barch=('amd64')
url="https://github.com/HeidiSQL/HeidiSQL"
license=('GPL-2.0')
conflicts=("${_basename}")
provides=("${_basename}")
replaces=("heidisql-bin")
depends=('gtk2' 'libperconaserverclient' 'mariadb-libs' 'postgresql-libs' 'sqlite')
source=("${_basename}_${pkgver}_${arch[0]}.deb::${url}/releases/download/v${pkgver}/${_basename}_${pkgver}_${_barch[0]}.deb")
sha256sums=('e871bb5cf92476d026bd8c5887cb2a83e6f13877adb077ef5fbdd2edf2936122')

package() {
  cd "${pkgdir}"

  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"

  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
} 
