# Maintainer: Patrick Burroughs (Celti) <celticmadman@gmail.com>
# Contributor: Keerthan Jaic <jckeerthan at gmail dot com>

pkgname=diorite-git
pkgver=2015.05.06.c9a04c6
pkgrel=1
pkgdesc="Utility and widget library based on Glib and GTK3."
arch=('i686' 'x86_64')
url="https://tiliado.eu/diorite"
license=('GPL')
makedepends=('git')
provides=('diorite')
depends=('python' 'vala' 'glib2' 'gtk3')
source=("$pkgname::git://github.com/tiliado/diorite")
sha256sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git log -1 --format="%cd.%h" --date=short | sed 's:-:.:g'
}

build() {
  cd "$pkgname"
  ./waf configure --prefix=/usr
  ./waf build
} 

package() {
  cd "$pkgname"
  ./waf install --destdir="${pkgdir}"
}
