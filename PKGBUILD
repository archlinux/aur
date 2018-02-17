# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.5.1
pkgrel=1
pkgdesc="A simple aur tool for managing a local 'aurto' repository"
arch=('any')
url="https://github.com/alexheretic/aurto"
license=('MIT')
depends=('aurutils<1.6.0'
         'devtools'
         'systemd'
         'pacutils')
optdepends=()
makedepends=()
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('62eb616cc3b3433b33fdba088cb480b6c838883d06450fcd14240ba47c2c69a4')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
