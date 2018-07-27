# Maintainer: crave <crave@noreply.org>

pkgname=fstar-ulib
pkgver=0.9.6.0
pkgrel=1
pkgdesc="compiles the ulib component of F*"
arch=('i686' 'x86_64')
url='https://www.fstar-lang.org/'
license=('Apache-2.0')
options=('!strip' '!makeflags' 'staticlibs')
depends=('fstar')

build() {
  cd "$srcdir/"
  cp -r /opt/fstar fstar
  export FSTAR_HOME="$(pwd)/fstar"
  cd fstar
  make
}

package() {
  install -dm 755 "fstar/ulib"
}
