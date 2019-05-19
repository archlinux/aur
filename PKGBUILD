# Maintainer: Thaodan <theodorstormgrade@gmail.com>
# Contributor: Lázaro Armando <aur at chipojosoft.com>

_pkgname=purple-rocketchat
pkgname=$_pkgname-hg
pkgrel=1
pkgver=r90.826990b48f41
pkgdesc="A purple (pidgin, finch, ...) plugin for RocketChat services"
depends=( "libpurple" "json-glib" "zlib" "discount>=2.1.7")
makedepends=('mercurial')
url="https://bitbucket.org/EionRobb/purple-rocketchat"
arch=('i686' 'x86_64')
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname)
source=('hg+https://bitbucket.org/EionRobb/purple-rocketchat')
md5sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}



build() {
   cd $_pkgname
   make
}

package() {
   cd $_pkgname
   make DESTDIR="$pkgdir/" install
}
