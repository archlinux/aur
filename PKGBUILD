#Maintainer: Lubosz Sarnecki <lubosz@gmail.com> 

_realname=keyfinder
pkgname=$_realname-git
pkgver=243.e200ccc
pkgrel=1
pkgdesc="KeyFinder is a tool for estimating the musical key of digital recordings, to aid DJs in harmonic mixing."
arch=('i686' 'x86_64')
url="http://www.ibrahimshaath.co.uk/keyfinder/"
license=('GPL3')
depends=('qt5-base' 'libsamplerate' 'libkeyfinder-git' 'qt5-xmlpatterns') 
makedepends=('git')
provides=($_realname)
conflicts=($_realname)

_gitname=is_KeyFinder

source=("git://github.com/ibsh/is_KeyFinder.git")
sha256sums=("SKIP")

pkgver() {
  cd $_gitname
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

build() {
  cd $_gitname
  qmake-qt5
  make
}

package() {
  cd $_gitname
  make INSTALL_ROOT="${pkgdir}" install
}
