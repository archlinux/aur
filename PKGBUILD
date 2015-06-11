# This is gross, but can totally save you if you need to fix a machine
# on which you can't easily boot install media.

pkgname=pacman-static
pkgver=2015
pkgrel=5
pkgdesc="Statically-compiled pacman (to fix or install systems without libc)"
arch=('i686' 'x86_64')
url="http://www.archlinux.org/pacman/"
license=('GPL')
makedepends=(gnupg abs asciidoc python2 fakechroot)
optdepends=('gnupg: verify package integrity')
source=(genpacmanstatic)
sha256sums=('77c706302199aa096dc990a71494f4525b819a81deab194cd2fc5ab1b6032b28')

build() {
   cd "$srcdir"
   export ASROOT
   ./genpacmanstatic
}

package() {
  install -sD "$srcdir"/overlay/usr/bin/pacman-static \
      "$pkgdir"/usr/bin/pacman-static
}
