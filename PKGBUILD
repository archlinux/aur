# Maintainer: Felix Yan <felixonmars@archlinux.org>

pkgname=pacman-accel-git
pkgver=0.179.1ffa237
pkgrel=1
pkgdesc="Pacman accelerator - try each mirror while still using latest db"
arch=('any')
url="https://github.com/felixonmars/archlinux-futils/blob/master/pacman-accel"
license=('MIT')
depends=('ruby-http' 'ruby-puma' 'ruby-sinatra')
makedepends=('git')
source=("git+https://github.com/felixonmars/archlinux-futils.git")
md5sums=('SKIP')

pkgver() {
  cd archlinux-futils
  echo 0.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

package() {
  cd archlinux-futils
  install -Dm755 pacman-accel -t "$pkgdir"/usr/bin/
  install -Dm644 pacman-accel.service -t "$pkgdir"/usr/lib/systemd/system/
  install -Dm644 LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
}

# vim:set ts=2 sw=2 et:
