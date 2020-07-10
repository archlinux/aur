# Maintainer: Patrick Wicki <patrick.wicki96 at gmail dot com>

pkgname=barify
pkgver=r4.6734055
pkgrel=1
pkgdesc='Modify volume or brightness and display result as a bar via notifications'
arch=(any)
url="https://github.com/arctize/barify"
source=("git+$url.git")
license=(GPL3)
depends=(git notification-daemon)
optdepends=('dunst: for notifications on Xorg'
            'mako: for notifications on Wayland')
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm 755 barify "$pkgdir/usr/bin/barify"
}
