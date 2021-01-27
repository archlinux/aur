# Maintainer: Michael Eliachevitch <m.eliachevitch@posteo.de>
# Contributor (maintainer of previous -hg version): Thaodan <theodorstormgrade@gmail.com>
# Contributor (of previous -hg version): Lázaro Armando <aur at chipojosoft.com>

_pkgname=purple-rocketchat
pkgname=$_pkgname-git
pkgrel=1
pkgver=6.8db8f8e
pkgdesc="A purple (pidgin, finch, ...) plugin for RocketChat services"
depends=( "libpurple" "json-glib" "zlib" "discount>=2.1.7")
makedepends=('git')
url="https://github.com/EionRobb/purple-rocketchat"
arch=('i686' 'x86_64')
license=('GPL3')
provides=($_pkgname)
conflicts=($_pkgname $_pkgname-hg)
replaces=($_pkgname-hg)
source=('git+https://github.com/EionRobb/purple-rocketchat')
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
   cd $_pkgname
   make
}

package() {
   cd $_pkgname
   make DESTDIR="$pkgdir/" install
}
