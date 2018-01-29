# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.1
pkgrel=1
pkgdesc="A simple aur tool for managing a local 'aurto' repository"
arch=('any')
url="https://github.com/alexheretic/aurto"
license=('MIT')
depends=('aurutils'
         'devtools'
         'systemd')
optdepends=()
makedepends=()
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7173bf8a4ebb7203bb26f727851f5a1d9b6f351a347b3e242680ae7f44e7a3f6')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
