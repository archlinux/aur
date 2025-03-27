# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=adw-gimp3-git
pkgver=r22.6a0f4c8
pkgrel=1
pkgdesc="adw-gtk3 patches for GIMP 3"
arch=('any')
url="https://github.com/dp0sk/adw-gimp3"
license=('GPL-3.0-or-later')
depends=('adw-gtk-theme')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/dp0sk/adw-gimp3.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package() {
  cd "${pkgname%-git}"
  install -Dm644 "${pkgname%-git}"/*.css -t \
    "$pkgdir/usr/share/gimp/3.0/themes/${pkgname%-git}/"
  install -Dm644 README.md -t "$pkgdir/usr/share/doc/$pkgname/"
}
