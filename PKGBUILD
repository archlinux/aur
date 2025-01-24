# Maintainer: D3vil0p3r <vozaanthony [at] gmail [dot] com>

pkgname=sddm-astronaut-theme
pkgver=62.8f41a83
pkgrel=1
pkgdesc='Modern looking sddm qt6 theme.'
arch=('any')
url='https://github.com/Keyitdev/sddm-astronaut-theme'
license=('LGPL3')
depends=('sddm' 'qt6-5compat' 'qt6-declarative' 'qt6-multimedia-ffmpeg' 'qt6-svg' 'qt6-virtualkeyboard')
makedepends=('git')
source=("git+https://github.com/Keyitdev/sddm-astronaut-theme")
md5sums=("SKIP")

pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long --tags --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

package() {
  cd "$pkgname"
  install -dm 755 "${pkgdir}/usr/share/sddm/themes/sddm-astronaut-theme"
  install -dm 755 "${pkgdir}/usr/share/fonts"

  cp -rf * "${pkgdir}/usr/share/sddm/themes/sddm-astronaut-theme/"
  cp -rf Fonts/* "${pkgdir}/usr/share/fonts/"
}
