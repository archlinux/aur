# Maintainer: Alex Butler <alexheretic@gmail.com>
pkgname=aurto
pkgver=0.7.4
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
sha256sums=('115fcdf6bf6d6a522dc32ba999481e6ed21ce15b5f02fba1410b2ba35fd93506')
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
