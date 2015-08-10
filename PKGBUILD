# Maintainer: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>
pkgname=light-git
pkgver=v0.9.r1.g8dfe104
pkgrel=1
pkgdesc='Program to easily change brightness on backlight-controllers.'
arch=('any')
url="https://github.com/haikarainen/light"
license=('GPL3')
makedepends=('git')
conflicts=('lightscript' 'light')
provides=('lightscript' 'light')
replaces=('lightscript')
source=('git+https://github.com/haikarainen/light.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/light"
  git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/light"
  make
}

package(){
  cd "$srcdir/light"
  make DESTDIR="$pkgdir/" install
}
