# Maintainer: Victor B <victor.bonnelle@protonmail.com>
# Maintainer: Jonas Tranberg <jonastranberg93@gmail.com>
pkgname=flova-lightdm-webkit-theme-sequoia-git
pkgver=r30.378dd0c
pkgrel=1
pkgdesc="A simple LightDM theme (Flova fork, fixes buttons alignement)"

arch=('any')
url="https://github.com/Flova/lightdm-webkit-sequoia/tree/patch-1"
license=('MIT')
depends=('lightdm-webkit2-greeter')
makedepends=('git')
source=('git+https://github.com/Flova/lightdm-webkit-sequoia.git#branch=patch-1')
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
