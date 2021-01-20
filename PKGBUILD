# Maintainer: Gray <apoco@pm.me>
pkgname=dartbuster
pkgver=1.0.2
pkgrel=1
pkgdesc="URL Fuzzing / brute forcing tool, written in dart."
arch=('any')
url="https://github.com/GrayWasTaken/dartbuster"
license=('MIT')
makedepends=('git' 'dart')
changelog=
source=("git+$url")
md5sums=('SKIP') #autofill using updpkgsums
pkgdir="/opt/$pkgname"

build() {
  cd "$pkgname"
  pub get
  dart2native bin/dartbuster.dart -o bin/dartbuster
}

package() {
  cd "$pkgname"
  mkdir -p "$pkgdir/opt/$pkgname"
  cp -rf * "$pkgdir/opt/$pkgname"
  ln -sf "$pkgdir/opt/$pkgname" "/bin/$pkgname"
}

# todo on uninstall remove binary aswell as /opt/dartbuster