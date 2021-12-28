# Maintainer: JohnCiubuc <john.ciubuc@protonmail.com>
# Contributor: tuftedocelot@fastmail.fm
# Contributor: Lucas de Vries <lucas@glacicle.org>
_pkgname=cortex
pkgname=${_pkgname}-git
pkgver=r59.ff10ff8
pkgrel=1
pkgdesc="An ncurses reddit browser and monitor"
license=('MIT/X11')
arch=('any')
url="http://cortex.glacicle.org/"
depends=('python')
makedepends=('git')
source=('git+https://github.com/GGLucas/cortex.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd $_pkgname
  install -D -m755 "$srcdir/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -D -m644 "$srcdir/$_pkgname/$_pkgname.1" "$pkgdir/usr/share/man/man1/$_pkgname.1"
}
