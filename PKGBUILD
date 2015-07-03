# Maintainer: Simon Tunnat <simon+aur@tunn.at>
# Author: Maep <piconna@googlemail.com>
# Contributor: Guff <cassmacguff@gmail.com>
# Contributor: Gabriel Peixoto <gabrielrcp@gmail.com>

pkgname=fehlstart-git
pkgver=0.99.82c8a3f
pkgrel=1

# new version numbering with pacman 4.1
epoch=1

pkgdesc="A simple application launcher written in C and using GTK"
arch=('i686' 'x86_64')
url="https://gitorious.org/fehlstart/pages/Home"
license=('GPL3')
depends=('libkeybinder2')
makedepends=('git')
provides=('fehlstart')
conflicts=('fehlstart')

source=('git+https://git.gitorious.org/fehlstart/fehlstart.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/fehlstart"
  echo "0.$(git rev-list --count HEAD).$(git describe --always)"
}

build() {
  cd "$srcdir/fehlstart"

  make
}

package() {
  cd "$srcdir/fehlstart"
  make PREFIX="/usr" DESTDIR="$pkgdir/" install
} 
