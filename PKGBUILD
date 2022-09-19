# Maintainer: Cristian Gutierrez <cristian@crstian.me>

pkgname="thokr-git"
pkgver=v0.1.0.r1.g84ff078
pkgrel=1
pkgdesc="A sleek typing tui written in rust "
arch=('any')
url="https://github.com/coloradocolby/thokr"
license=('MIT')
makedepends=('cargo' 'git')
provides=('mow')
source=('git+https://github.com/thatvegandev/thokr.git')
md5sums=('SKIP')


pkgver() {
  cd $srcdir/thokr/;
  git describe --tags --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g';  
}

build() {
  cd $srcdir/thokr/;
  cargo build \
    --release \
        -vv;
}

package() {
  install \
    -Dm755 \
        $srcdir/${pkgname//-git}/target/release/${pkgname//-git} \
        $pkgdir/usr/bin/${pkgname//-git};
}
