# Maintainer: Anton Pirogov <anton pirogov at gmail dot com>

pkgname=x11remote
pkgver=0.1
pkgrel=1
pkgdesc='Simple mouse and keyboard remote control as touchscreen HTML5 web-app'
url="http://github.com/apirogov/${pkgname}"
license=('MIT')
arch=('i686' 'x86_64')
depends=('xdotool' 'xorg-xmodmap')

makedepends=('git' 'ghc' 'cabal-install')
source=("git+https://github.com/apirogov/${pkgname}.git")
md5sums=('SKIP')

# PKGBUILD functions

build() {
   cd ${srcdir}/${pkgname}

   cabal update

   cabal sandbox init
   cabal install --only-dependencies
   cabal configure -O --prefix=/usr
   cabal build
}

package() {
   cd ${srcdir}/${pkgname}
   cabal copy --destdir=${pkgdir}
}

