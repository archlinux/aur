# Maintainer: Ranieri Althoff <ranisalt+aur at gmail dot com>

pkgname=gnome-shell-extension-clock-override-git
pkgver=5+40+g7dd30bc
pkgrel=1
pkgdesc='Customize the date and time format displayed in clock in the top bar in GNOME Shell'
url='https://github.com/stuartlangridge/gnome-shell-clock-override'
license=('GPL')
arch=('any')
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
makedepends=('git' 'zip')
depends=('gnome-shell>=3.18')
source=("${pkgname}::git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --long --tags | sed 's/^v//; s/-/+/g'
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make PREFIX="$pkgdir/usr/share/gnome-shell/extensions/" install
}
