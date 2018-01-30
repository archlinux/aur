# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.3
pkgrel=1
pkgdesc="A simple aur tool for managing a local 'aurto' repository"
arch=('any')
url="https://github.com/alexheretic/aurto"
license=('MIT')
depends=('aurutils'
         'devtools'
         'systemd'
         'pacutils')
optdepends=()
makedepends=()
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('32961db87bc206104679ba804c89a2d8693e3e7b2dab92e8c629318939a8189e')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
