# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.7.5
pkgrel=1
pkgdesc="A simple aur tool for managing a local 'aurto' repository"
arch=('any')
url="https://github.com/alexheretic/aurto"
license=('MIT')
depends=('aurutils<1.6.0'
         'devtools'
         'systemd'
         'pacutils'
         'pacman-contrib'
         'curl'
         'sudo')
optdepends=()
makedepends=('cargo')
install="aurto.install"
source=("https://github.com/alexheretic/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('6252cf22360aa5d483565f4c0f9e72a9848412a4addad0abc2d39da482fc1eb2')
backup=('usr/lib/systemd/system/check-aurto-git-trigger.timer'
        'usr/lib/systemd/system/update-aurto.timer')

build() {
  cd "$pkgname-$pkgver"
  make
}

package() {
  cd "$pkgname-$pkgver"
  cp -r target/* "$pkgdir"/
}
