# Maintainer: detiam <dehe_tian@outlook.com>

pkgname=noto-fonts-cjk-fontconfig
pkgver=1
pkgrel=1
pkgdesc="Append noto-fonts-cjk to noto-fonts according to the locale"
arch=('any')
url="https://aur.archlinux.org/packages/noto-fonts-cjk-fontconfig"
license=('GPL-3.0-or-later')
depends=('noto-fonts-cjk')
source=("70-noto-cjk.conf")
sha256sums=('509850d08405d2004bf3ed3e725cabc10c87a9915122cbeb94580efaf39f6a04')

package() {
  install -Dm644 "${source[0]}" -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
