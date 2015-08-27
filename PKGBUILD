# Maintainer: Pieter Goetschalckx <3.14.e.ter at gmail dot com>

pkgname=numix-folders-git
pkgver=r346.1033a15
pkgrel=1
pkgdesc="Alternate folders for use with the Numix base icon theme."
arch=('any')
url="https://github.com/numixproject/numix-folders"
license=('GPL3')
depends=('numix-themes-git' 'python-gobject' 'gksu')
source=("numix-folders::git+https://github.com/numixproject/numix-folders")
md5sums=('SKIP')

pkgver() {
  cd numix-folders
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd numix-folders
  rm -rf .git LICENSE README.md
}

package() {
  cd numix-folders

  install -dm 755 "$pkgdir/usr/share/numix-folders"
  install -dm 755 "$pkgdir/usr/bin"

  cp -dr --no-preserve='ownership' * "$pkgdir/usr/share/numix-folders/"
  ln -s /usr/share/numix-folders/numix-folders $pkgdir/usr/bin/numix-folders
}

# vim:set ts=2 sw=2 et:

