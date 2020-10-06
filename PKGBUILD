# Maintainer: Chris Tam <LChris314 at gmail dot com>

pkgname=fcitx5-arc-git
pkgver=r5.5d2a398
pkgrel=1
pkgdesc="Arc color theme for fcitx5"
arch=('any')
url="https://github.com/Kienyew/fcitx5-arc-theme"
license=('MIT')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=("git")
source=("git+${url}.git")
sha512sums=('SKIP')

pkgver() {
  cd fcitx5-arc-theme
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd fcitx5-arc-theme
  for _variant in Arc Arc-Dark; do
    install -Dm644 "$_variant"/{arrow.png,highlight.png,next.png,panel.png,prev.png,radio.png,theme.conf} -t "${pkgdir}/usr/share/fcitx5/themes/${_variant}/"
  done
}
