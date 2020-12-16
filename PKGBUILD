# Maintainer: mrabe89 <mrabe@hatdev.de>
pkgname="secureboot.sh"
pkgdesc='A very basic script to setup secureboot'

pkgver=0.0.3
pkgrel=1

arch=('x86_64')
url='https://github.com/mrabe89/secureboot.sh'
license=('GPL')

depends=('systemd' 'dracut' 'efitools' 'sbsigntools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mrabe89/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=("1c11564200d43468cce9d0a1b1466c7bbd88dbcad7e98dfa078c45ed0f77fbb6")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -D -m 700 "secureboot.sh"  "$pkgdir/usr/bin/secureboot.sh"
  install -D -m 644 "conf/archlinux" "$pkgdir/etc/secureboot/config"
  install -D -m 644 "linux-sb.hook"  "$pkgdir/usr/share/libalpm/hooks/90-linux-sb.hook"
  install -D -m 644 "fwupd-sb.hook"  "$pkgdir/usr/share/libalpm/hooks/90-fwupd-sb.hook"
}

# vim:set ts=2 sw=2 et:
