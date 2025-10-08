# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
pkgname=heidisql
pkgver=12.12.1.208
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases."
arch=(any)
url="http://www.heidisql.com/"
license=('GPL')
depends=(gtk2 mariadb-libs postgresql-libs libperconaserverclient sqlite)
# using the deb because it already conveniently includes related files like icons and a desktop entry (not included in the .tar.xz)
source=("https://www.heidisql.com/downloads/releases/HeidiSQL_$pkgver.deb")
install="$pkgname.install"
sha256sums=('085219bec7bbe74e30a8c300eada1af5ad08f7136ee8cd2f3b18dff0656aecf2')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.zst"
  # fix directory permissions
  find . -type d ! -path "./usr/share/doc/heidisql" ! -path "./usr/share/heidisql/locale" -exec chmod 755 {} +
}
