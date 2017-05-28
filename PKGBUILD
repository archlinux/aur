# Maintainer: Ainola

pkgname=ttf-material-wifi-icons-git
pkgver=r10.7631309
pkgrel=1
arch=('any')
url='https://github.com/dcousens/material-wifi-icons'
pkgdesc='WiFi icons inspired by Material Icons'
license=('custom')
source=('git://github.com/dcousens/material-wifi-icons.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir"/material-wifi-icons
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  # As upstream named the font with a hyphen in the name, remember to escape
  # the hyphen in your application. For example, with Polybar, use:
  # font-3 = material\-wifi:size=10

  install -Dm644 "$srcdir"/material-wifi-icons/material-wifi.ttf \
    "$pkgdir/usr/share/fonts/TTF/material-wifi.ttf"
}
