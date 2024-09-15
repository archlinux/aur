# Maintainer: Radek Podgorny <radek@podgorny.cz>
# Contributor: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: Alyssa Hung <deciare@isisiew.org>
# Contributor: Matt Brennan
# Contributor: falconindy
# Contributor: adee
# Contributor: mystilleef

pkgname=zramswap
pkgver=6
pkgrel=1
pkgdesc="Sets up zram-based swap devices on boot"
arch=('any')
url="http://en.wikipedia.org/wiki/ZRam"
license=('GPL')
depends=('bash')
backup=("etc/zramswap.conf")
source=("zramctrl"
        "zramswap.conf"
        "zramswap.service")
md5sums=('fb633774fb523b7107ca62b2647aec89'
         'aff850d716b5d9a181418cfe9116b279'
         'a746969adc521826c14b0796968f3ca6')

package() {
  install -Dm755 zramctrl $pkgdir/usr/lib/systemd/scripts/zramctrl
  install -Dm644 zramswap.conf $pkgdir/etc/zramswap.conf
  install -Dm644 zramswap.service $pkgdir/usr/lib/systemd/system/zramswap.service
}
