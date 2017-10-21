# Maintainer:
# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>
# Contributor: dibblethewrecker dibblethewrecker.at.jiwe.dot.org

pkgname=shp2svg
pkgver=0.5.1
pkgrel=5
pkgdesc="Takes the text input from shp2pgsql and converts it to SVG files"
arch=('any')
url="http://old.carto.net/papers/svg/utils/shp2svg/"
license=('LGPL')
depends=('postgis' 'perl-math-round')
source=(http://old.carto.net/papers/svg/utils/shp2svg/ogis2svg.pl)
sha256sums=('05f8ff0eac46f54084793717c4542e37bc0acb55fdd822fe75db8aa59bc90bfd')

package() {
  install -Dm755 "${srcdir}"/ogis2svg.pl "${pkgdir}"/usr/bin/ogis2svg.pl
  # add a symlink because the name of the script is a little confusing.
  ln -sf /usr/bin/ogis2svg.pl "${pkgdir}"/usr/bin/shp2svg
}
