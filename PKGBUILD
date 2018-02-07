# Maintainer: Tiago Koji Castro Shibata <tiago.shibata@gmail.com>
pkgname=lm4flash-git
pkgver=v0.1.2.r14.g65fbc45
pkgrel=1
pkgdesc="Development tools fot the TI Launchpad boards"
arch=('x86_64' 'i686')
url="https://github.com/utzig/lm4tools"
license=('GPL')
depends=('libusb')
makedepends=('git')
provides=('lm4flash')
conflicts=('lm4flash')
source=('git+https://github.com/utzig/lm4tools.git')
md5sums=('SKIP')

pkgver() {
  cd lm4tools
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lm4tools/lm4flash"
  make
}

package() {
  install -Dm755 lm4tools/lm4flash/lm4flash "$pkgdir/usr/bin/lm4flash"
}
