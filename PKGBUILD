# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
pkgname=cosmic-icons-git
pkgver=r11.1e328da
pkgrel=2
pkgdesc="System76 Cosmic icon theme"
arch=('any')
url="https://github.com/pop-os/cosmic-icons"
license=('CC-BY-SA-4.0 AND GPL-3.0-or-later')
depends=('pop-icon-theme-git')
makedepends=('git' 'just')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=('git+https://github.com/pop-os/cosmic-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "${pkgname%-git}"
  just rootdir="$pkgdir" install

  install -Dm644 COPYING LICENSE -t "$pkgdir/usr/share/licenses/${pkgname%-git}/"
}
