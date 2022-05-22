# Contributor: smlb <smlbr01@gmail.com>
# Contributor: Davide Depau <davide@depau.eu>
# Maintainer: Tuure Piitulainen <tuure.piitulainen@gmail.com>

pkgname=brightnessctl-git
pkgver=0.5.1.r17.gef49d47
pkgrel=1
pkgdesc="Lightweight brightness control tool"
arch=('i686' 'x86_64')
url="https://github.com/Hummer12007/brightnessctl"
license=('MIT')
makedepends=('git')
provides=('brightnessctl')
conflicts=('brightnessctl')
source=("$pkgname::git+https://github.com/Hummer12007/brightnessctl.git")
sha256sums=('SKIP')    

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"
  ./configure --prefix=/usr --enable-logind
  make
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR="$pkgdir" install
}

