# Maintainer: Josh Dye <josh.jpenguin@gmail.com>
# Contributor: Tasos Latsas <tlatsas2000@gmail.com>

pkgname=monopd
pkgver=git
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc="A dedicated game server daemon for playing Monopoly-like board games"
url="http://www.robertjohnkaper.com/software/atlantik/"
license=('GPL')
depends=("git" "muparser" "utf8cpp")
source=("git+git://git.tuxfamily.org/gitroot/gtkatlantic/atlanticd.git")

md5sums=("SKIP")

build() {
  cd "${srcdir}/atlanticd"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/atlanticd/"

  make DESTDIR="${pkgdir}" install
}
