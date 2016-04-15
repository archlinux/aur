# $Id: PKGBUILD 72016 2012-06-05 19:54:42Z seblu $
# Maintainer: Quan Guo <guotsuan@gmail.com>

pkgname=awesome-treetile-git
pkgver=2016.03.06.g15a5ecc
pkgrel=1
pkgdesc='Treetile is binary tree-based, dynamical tiling layout for Awesome 3.5
and latter.'

arch=('any')
url='https://github.com/guotsuan/awesome-revelation.git'
license=('GPL3')
depends=('awesome')
source=('git+https://github.com/guotsuan/awesome-treetile.git')
md5sums=('SKIP')
_gitname='awesome-treetile'



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
  install -Dm644 init.lua "$pkgdir/usr/share/awesome/lib/treetile/init.lua"
  install -Dm644 bintree.lua "$pkgdir/usr/share/awesome/lib/treetile/init.lua"
  install -Dm644 init.lua "$pkgdir/usr/share/awesome/lib/treetile/init.lua"
  install -Dm644 layout_icon.png "$pkgdir/usr/share/awesome/lib/treetile/init.lua"
  # Install documentation
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim:set ts=2 sw=2 ft=sh et:
