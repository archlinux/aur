# Maintainer: zeroproject <contact@zeroproject.dev>
pkgname=zomodoro
pkgver=2.0.1
pkgrel=1
pkgdesc="Simple pomodoro made in Qt"
arch=('x86_64')
url="https://github.com/zeroproject-dev/zomodoro"
license=('MIT')
depends=('qt5-base')
makedepends=('git' 'make' 'qt5-tools')
source=('zomodoro::git+http://github.com/zeroproject-dev/zomodoro.git')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$pkgname"
  qmake ./Zomodoro.pro
  make
}

package() {
  cd "$pkgname"
  ls -la
  install -Dm755 ./Zomodoro "$pkgdir/usr/bin/zomodoro"
  install -Dm644 ./README.md "$pkgdir/usr/share/doc/$pkgname"
}
