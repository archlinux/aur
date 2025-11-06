# Maintainer: Nico <d3sox at protonmail dot com>
# Contributor: Liviu Cristian Mirea-Ghiban <liviu dot mirea at wecodepixels dot com>
# Contributor (Qt5 version's aur package): kekmacska <kekmacska2 at protonmail dot com>
pkgname=heidisql-qt5
pkgver=12.13.1.1_4_ge95aca86_dirty_qt5_1
pkgrel=2
pkgdesc="A lightweight GUI for managing MySQL, PostgreSQL, and Microsoft SQL databases. Qt5 version, avoids GTK2-based base version's deprecated gtk2 dependency, uses qt5-base, a still supported package instead."
arch=('x86_64')
url="http://www.heidisql.com/"
license=('GPL')
depends=(qt5pas qt5-base mariadb-libs)
optdepends=(sqlite libperconaserverclient postgresql-libs)
# using the deb because it already conveniently includes related files like icons and a desktop entry (not included in the .tar.xz). Currently dropbox only, upstream only packaged it there. I will use the github releases as soon as i can.
source=("https://www.dropbox.com/scl/fi/09vlj6hf0a1w8ok5qk4wg/heidisql_12.13.1.1-4-ge95aca86-dirty-qt5-1_amd64.deb?rlkey=izfkl52khll2hivris8zjh6fg&st=3ztpaxsc&dl=0")
install="$pkgname.install"
sha256sums=('c7198c987a01ac55f498c9af1fe055aed6b432fbe0c488539bc8cdd413b1b0c1')

package() {
  cd "${pkgdir}"
  # this extracts all into the pkgdir
  tar xf "${srcdir}/data.tar.gz"
  # fix directory permissions
  find . -type d -exec chmod 755 {} +
  chmod 775 usr/share/doc/heidisql usr/share/heidisql/locale
	echo "\e[31mheidisql-debug is installed too. If you don't need it, you can remove it with the following command:\e[0m"
	echo "\e[32m sudo pacman -R heidisql-debug\e[0m"
}
