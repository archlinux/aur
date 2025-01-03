# Maintainer: Masato TOYOSHIMA <phoepsilonix at phoepsilonix dot love>

pkgname=noto-cjk-fontconfig
pkgver=1
pkgrel=1
pkgdesc="Append noto-fonts-cjk to noto-fonts according to the locale"
arch=('any')
url="https://aur.archlinux.org/packages/noto-cjk-fontconfig"
license=('GPL-3.0-or-later')
source=("53-cjk.conf")
sha256sums=('de396ba9e7e803751f6ddee133e7697c177861926bd044391fb68b2b94ec26d4')

package() {
  install -Dm644 "${source[0]}" -t "$pkgdir"/usr/share/fontconfig/conf.avail
  install -d "$pkgdir"/usr/share/fontconfig/conf.default
  ln -rs "$pkgdir"/usr/share/fontconfig/conf.avail/* "$pkgdir"/usr/share/fontconfig/conf.default
}
