# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=emacs-git-modes-git
pkgver=1.0.0
pkgrel=1
pkgdesc="Some git modes needed by emacs-magit-git"
arch=('any')
url="https://github.com/magit/git-modes"
license=('GPL3')
depends=('emacs' 'git')
makedepends=('git')
provides=('emacs-git-modes')
conflicts=('emacs-git-modes')
source=("git+https://github.com/magit/git-modes.git")
md5sums=('SKIP')
_gitname="git-modes"

pkgver() {
  cd $srcdir/$_gitname
  git describe --tags | sed 's|-|.|g' 
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make PREFIX="${pkgdir}/usr/" install 
}
