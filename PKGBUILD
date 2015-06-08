# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
# Contributor: fl4ppie at gmail dot com
# Contributor: bender02 at gmx dot com

pkgname=emacs-planner-git
pkgver=3.42.23.g145e9e3
pkgrel=1
pkgdesc="A Personal Information Management tool for emacs from git"
arch=('any')
url="http://www.emacswiki.org/cgi-bin/wiki/PlannerMode"
license=('GPL')
depends=('emacs-muse')
makedepends=('git')
provides=('emacs-planner')
conflicts=('emacs-planner')
install=
source=("git://repo.or.cz/planner-el.git")
md5sums=('SKIP')
_gitname="planner-el"

pkgver() {
  cd "$srcdir"/"$_gitname"
  git describe --tags | sed 's|-|.|g' |cut -c2-
}

build() {
  cd "$srcdir"/"$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make INFODIR=$pkgdir/usr/share/info PREFIX=$pkgdir/usr install
}
