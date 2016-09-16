pkgname=pacitude
pkgver=1.0
pkgrel=1
pkgdesc="a pacman/pacaur wrapper with apt inspired syntax"
arch=('i686' 'x86_64')
url="https://github.com/undeadrevo/pacitude"
license=('WTFPL')
depends=('sudo' 'pacaur' 'cower')
makedepends=('git')
source=('git://github.com/undeadrevo/pacitude.git')
md5sums=('SKIP')
_gitname="pacitude"
pkgver() {
        cd "$_gitname" &&
        printf '%s.%s\n' "$(git rev-list --count HEAD)" \
                         "$(git rev-parse --short HEAD)"
}

package() {
        cd "$_gitname" &&
        install -m 755 -D pacitude "$pkgdir/usr/bin/pacitude"
}
