pkgname=brightnessctl-git
pkgver=0.3.r1.gec0664a
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url='https://github.com/Hummer12007/brightnessctl'
license=('MIT')
makedepends=('git' 'pkg-config')
_gitname=brightnessctl
source=("git://github.com/Hummer12007/$_gitname")
sha256sums=('SKIP')    

pkgver() {
    cd "$srcdir/$_gitname"
    git -C "${_pkgname}" describe --tags | sed "s/-/.r/;s/-/./g"
}

build() {
  cd "$srcdir/$_gitname"
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install
}

