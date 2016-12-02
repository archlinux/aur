# Maintainer: Jonas Tranberg <jonastranberg93@gmail.com>
pkgname=lightdm-webkit-theme-sequoia-git
pkgver=r21.cd5d4aa
pkgrel=1
pkgdesc="A simple LightDM theme"

arch=('any')
url="https://github.com/naueramant/lightdm-webkit-sequoia"
license=('MIT')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=('git+https://github.com/naueramant/lightdm-webkit-sequoia.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/lightdm-webkit-sequoia/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  install -dm755 "$pkgdir/usr/share/lightdm-webkit/themes/sequoia"
  cp -r "$srcdir/lightdm-webkit-sequoia/"* \
    "$pkgdir/usr/share/lightdm-webkit/themes/sequoia/"
}