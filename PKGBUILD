# Maintainer: mrabe89 <mrabe@hatdev.de>
pkgname="secureboot.sh"
pkgdesc='A very basic script to setup secureboot'

pkgver=0.0.4
pkgrel=1

arch=('x86_64')
url='https://github.com/mrabe89/secureboot.sh'
license=('GPL')

depends=('systemd' 'dracut' 'efitools' 'sbsigntools')

backup=('etc/secureboot/config')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mrabe89/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=("7917b227d79318e954bfb987081a4dbff0bc678e865ac3f40ff284954c67402d")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -D -m 700 "secureboot.sh"  "$pkgdir/usr/bin/secureboot.sh"
  install -D -m 644 "conf/archlinux" "$pkgdir/etc/secureboot/config"
  install -D -m 644 "linux-sb.hook"  "$pkgdir/usr/share/libalpm/hooks/90-linux-sb.hook"
  install -D -m 644 "fwupd-sb.hook"  "$pkgdir/usr/share/libalpm/hooks/90-fwupd-sb.hook"
}

# vim:set ts=2 sw=2 et:
