# Maintainer: Jamin Collins <jamin.collins@gmail.com>
pkgname=mdmodern-mdm-theme-git
_gitname="MDModern"
pkgver=20150316.7a4ea5b
pkgrel=1
pkgdesc="An HTML5 theme for MDM's webkit greeter."
arch=('any')
url="https://github.com/philer/MDModern"
license=('GPL3')

makedepends=('git')

source=(
  "$_gitname::git+https://github.com/philer/MDModern.git"
)

sha256sums=('SKIP')

_gitroot=https://github.com/philer/MDModern.git

pkgver() {
  cd "$srcdir/$_gitname"
  git log -1 --date=short --format="%cd.%h" | tr -d '-'
}

package() {
  cd "$srcdir/$_gitname"
  destdir="${pkgdir}/usr/share/mdm/html-themes/mdmodern/"
  mkdir -p ${destdir}
  cp -r * ${destdir}
}

# vim:set ts=2 sw=2 et:
