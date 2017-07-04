# Maintainer: Bian Jiaping <ssbianjp@gmail.com>

pkgname=reflector-timer-weekly
pkgver=0.2.0
pkgrel=1
pkgdesc='Update pacman mirrorlist regularly'
arch=('any')
url='https://github.com/bianjp/aur-reflector-timer'
license=('MIT')
depends=('reflector' 'systemd')
conflicts=('reflector-timer')
backup=('etc/reflector.conf')
source=(
  'reflector.conf'
  'reflector.service'
  'reflector.timer'
  'reflector-timer.sh'
)
md5sums=(
  '82f955fc067815525ca0010f79aa7d43'
  'b50a7229d7102d520f9360ded92b771c'
  '4e9e78b1b0ec81b54fdf368583ad4257'
  '9aeefdf1c7778bcabd0ba926109e1328'
)

package() {
  install -D -m 644 'reflector.service' "$pkgdir/usr/lib/systemd/system/reflector.service"
  install -D -m 644 'reflector.timer' "$pkgdir/usr/lib/systemd/system/reflector.timer"
  install -D -m 644 'reflector.conf' "$pkgdir/etc/reflector.conf"
  install -D -m 755 'reflector-timer.sh' "$pkgdir/usr/bin/reflector-timer"
}
