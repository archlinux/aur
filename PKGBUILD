# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.5
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
sha256sums=('90d31d41088f96e00ba2eb12cd8cc97cd6890234e58526dd86c409359abca0ba')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
