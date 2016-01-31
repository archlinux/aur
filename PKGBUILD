# Contributor: Stefan Husmann <stefan-husmann@t-online.de>

pkgbase=qtikz-git
pkgver=r196.ab7bd73
pkgrel=1
pkgdesc="Small application helping you to create TikZ diagrams"
arch=('i686' 'x86_64')
url="https://github.com/fhackenberger/ktikz"
license=('GPL')
depends=('poppler-qt5' 'shared-mime-info' 'desktop-file-utils')
makedepends=('git' 'texlive-core' 'qt5-tools')
provides=('qtikz')
conflicts=('qtikz')
install=qtikz.install
source=("qtikz::git+https://github.com/fhackenberger/ktikz")
md5sums=('SKIP')
_gitname=qtikz

pkgver() {
  cd "$_gitname"
  printf "r%s.%s" $(git rev-list --count HEAD) $(git rev-parse --short HEAD)
}

build() {
  cd "$_gitname"
  qmake qtikz.pro
  make
}

package() {
  cd "$_gitname"
  make INSTALL_ROOT="$pkgdir/$pkgname" install
}


