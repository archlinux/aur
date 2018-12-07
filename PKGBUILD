# Maintainer: Anton Pirogov <anton pirogov at gmail dot com>

pkgname=x11remote
pkgver=0.1
pkgrel=3
pkgdesc='Simple mouse and keyboard remote control as touchscreen HTML5 web-app'
url="http://github.com/apirogov/${pkgname}"
license=('MIT')
arch=('i686' 'x86_64')
depends=('xdotool' 'xorg-xmodmap')

makedepends=('git') #this also needs stack, but usually stack is installed locally
source=("git+https://github.com/apirogov/${pkgname}.git")
md5sums=('SKIP')

# PKGBUILD functions
prepare() {
  cd ${srcdir}/${pkgname}
  stack install --only-snapshot

}

build() {
   cd ${srcdir}/${pkgname}
   stack build
}

package() {
   cd ${srcdir}/${pkgname}
   stack install --local-bin-path=${pkgdir}
}

