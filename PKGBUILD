# Maintainer:  Marcin (CTRL) Wieczorek <marcin@marcin.co>
# Contributor: Fredrik Haikarainen <fredrik.haikarainen@gmail.com>

pkgname=light-git
pkgver=1.0.r0.g9681c72
pkgrel=1
pkgdesc='Program to easily change brightness on backlight-controllers.'
arch=('i686' 'x86_64')
url="https://github.com/haikarainen/light"
license=('GPL3')
makedepends=('git' 'help2man')
conflicts=('light')
provides=('light')
source=('git+https://github.com/haikarainen/light.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/light"
  git describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build(){
  cd "$srcdir/light"
  make
}

package(){
  cd "$srcdir/light"
  make DESTDIR="$pkgdir/" install
}
