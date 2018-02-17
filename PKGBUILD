# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.5
pkgrel=3
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
sha256sums=('9c1ca86f20e30b1c083f79a6fe1fedcfdf039e332749eea16f38ee2491114058')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
