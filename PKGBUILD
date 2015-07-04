# Maintainer: tuftedocelot@fastmail.fm
# Contributor: Lucas de Vries <lucas@glacicle.org>
_pkgname=cortex
pkgname=${_pkgname}-git
pkgver=31
pkgrel=2
pkgdesc="An ncurses reddit browser and monitor"
license=('MIT/X11')
arch=('i686' 'x86_64')
url="http://cortex.glacicle.org/"
depends=('python')
makedepends=('git')
source=('git+https://github.com/GGLucas/cortex.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgname"
  git rev-list --count HEAD
}

package() {
  cd $_pkgname
  install -D -m755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 "$srcdir/$_pkgname/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
