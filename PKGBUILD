# Maintainer: shijie.chen <xingwozhonghua@126.com>
# Contributor: Jason <Jason@JasonServer.com>

pkgname=jqtools
pkgver=20.6.9
pkgrel=1
pkgdesc="A collection of small tools based on Qt development"
arch=('x86_64')
url="https://github.com/188080501/JQTools"
license=('MIT')
depends=('qt5-base' 'qt5-quickcontrols2' 'qt5-quickcontrols' 'qt5-svg' 'qt5-tools' 'qt5-graphicaleffects')
makedepends=('git')
source=('git+https://github.com/188080501/JQTools.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/JQTools"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/JQTools"
  qmake
  make
}

package() {
  cd "$srcdir/JQTools"
  install -Dm755 JQTools "$pkgdir/usr/bin/JQTools"
}
