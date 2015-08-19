# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Stefan Husmann [haawda]
# Contributor: Pável Varela Rodríguez [NeOnsKuLL]
pkgname=pybgsetter
pkgver=0.50.2.g4fdeb33
pkgrel=1

pkgdesc="Multi-backend GUI/CLI tool to set the desktop wallpaper."
url="http://bbs.archlinux.org/viewtopic.php?id=88997"
arch=('any')
license=('GPL')

depends=('python2' 'pygtk' 'imagemagick')
optdepends=(
  'hsetroot: to activate support for Hsetroot'
  'esetroot: to activate support for Esetroot'
  'habak: to activate support for Habak'
  'feh: to activate support for Feh'
)

source=(git+https://github.com/stefanhusmann/pybgsetter)
install=pybgsetter.install
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/-/./g'
}

package() {
  cd "$pkgname"
  ./install.sh "$pkgdir"/
}

