# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.13.1.1
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(gtk2 mariadb-libs postgresql-libs libperconaserverclient sqlite)
# using the deb because it already conveniently includes related files like icons and a desktop entry (not included in the .tar.xz)
source=("https://github.com/HeidiSQL/HeidiSQL/releases/download/v${pkgver}/heidisql_${pkgver}_amd64.deb")
install="$pkgname.install"
sha256sums=('e871bb5cf92476d026bd8c5887cb2a83e6f13877adb077ef5fbdd2edf2936122')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"
  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
}
