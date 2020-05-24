# Maintainer: Lindsay Roberts <os at lindsayr dot com>
#
# All credit to reddit user duhok1, see package URL

pkgname=noto-fonts-emoji-fontconfig
pkgver=0.1
pkgrel=1
pkgdesc="Noto Sans Emoji as system color emoji font"
arch=('any')
url="https://www.reddit.com/r/archlinux/comments/9q8dlj/how_to_better_enable_color_emojis/"
depends=('noto-fonts-emoji')
install=noto-fonts-emoji-fontconfig.install
source=('75-noto-color-emoji.conf')
md5sums=('87dbf2f0e455eaaec53c4b000130f75a')

package() {
  conf_file="75-noto-color-emoji.conf"
  mkdir -p "$pkgdir"/etc/fonts/conf.{avail,d}
  install -m644 $conf_file "$pkgdir/etc/fonts/conf.avail/"
  ln -fs "../conf.avail/$conf_file" "$pkgdir/etc/fonts/conf.d/"
}
