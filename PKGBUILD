# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=yadex
pkgver=1.7.0
pkgrel=6
pkgdesc="A Doom level editor with additional support for Heretic, Hexen and Strife"
gitid=bf9d7d76ea0ca6e61a26cf624996527799f254a3
arch=('i686' 'x86_64')
url="http://www.teaser.fr/~amajorel/yadex/"
license=('GPL2')
depends=('libx11' 'gcc-libs')
optdepends=('freedoom' 'doom1-wad')
backup=('etc/yadex.cfg')
install=$pkgname.install
source=(https://github.com/chungy/yadex/archive/${gitid}.tar.gz)
sha256sums=('e71e53d9d4cf2fa1485bffce848c7a0d3f3522ba417c7e6646b9cc01c4a02e23')

build() {
  cd $pkgname-$gitid

  ./configure --prefix=/usr

  make CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}"
}

package() {
  cd $pkgname-$gitid

  make DESTDIR="$pkgdir" install
}
