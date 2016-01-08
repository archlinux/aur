# Maintainer: Mitchel Humpherys <mitch.special@gmail.com>

pkgname=namhyung-global-git
_gitname=global
pkgver=e8571bc9eb
pkgrel=1
pkgdesc="GNU Global with extra goodies for Linux kernel development"
arch=(i686 x86_64)
url=https://github.com/namhyung/global
license=(GPL)
makedepends=(git)
source=(git+https://github.com/namhyung/global.git)
md5sums=(SKIP)
provides=(namhyung-global)

pkgver() {
  cd $_gitname
  git describe --always | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir/" install
}
