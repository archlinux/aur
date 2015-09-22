# $Id: PKGBUILD 72016 2012-06-05 19:54:42Z seblu $
# Maintainer: Sébastien Luttringer <seblu@aur.archlinux.org>

pkgname=awesome-revelation-git
pkgver=2015.09.22.g6535c9c
pkgrel=1
pkgdesc='Show all clients per screen in Awesome window manager. This is version
only working with master version of Awesome window manager. For stable version 
of awesome, 3.5.6, Please install awesome-revelation (current 3.5.6) instead. '
arch=('any')
url='https://github.com/guotsuan/awesome-revelation.git'
license=('GPL3')
depends=('awesome-git')
conflicts=('awesome-revelation')
source=('git+https://github.com/guotsuan/awesome-revelation.git')
md5sums=('SKIP')
_gitname='awesome-revelation'



pkgver() {
  cd "${srcdir}/${_gitname}"
      git log -1 --format="%cd.g%h" --date=short | sed 's/-/./g'
}

build() {
  cd $srcdir/${_gitname}
}

package() {
  cd ${srcdir}/${_gitname}
  # Install the library
  install -Dm644 init.lua "$pkgdir/usr/share/awesome/lib/revelation/init.lua"
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 ft=sh et:
