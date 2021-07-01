# Maintainer: gr m21 <grm21@protonmail.com>
pkgname=lnch
pkgver=6ed336d
pkgrel=1
epoch=1
pkgdesc="A simple go binary that runs and disowns a command"
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
makedepends=('git' 'go')
url="https://github.com/oem/lnch"
license=('MIT')
source=(git+https://github.com/oem/lnch)
sha256sums=('SKIP')
provides=('lnch')

pkgver() {
  cd ${pkgname%-git}
  echo $pkgver
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  go build -o lnch main.go
}

package() {
  cd ${pkgname%-git}
  install -Dm 755 lnch -t "$pkgdir"/usr/bin
}
