# Maintainer: mrabe89 <mrabe@hatdev.de>
pkgname="secureboot.sh"
pkgdesc='A very basic script to setup secureboot'

pkgver=0.0.1
pkgrel=1

arch=('x86_64')
url='https://github.com/mrabe89/secureboot.sh'
license=('GPL')

depends=('systemd' 'dracut' 'efitools' 'sbsigntools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mrabe89/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=("df7ab8565a282aa58bfe09d77f729545550f41083bbcc78c236adbdadc3e8eb1")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -D -m 700 "secureboot.sh"   "$pkgdir/usr/bin/secureboot.sh"
  install -D -m 644 "secureboot.hook" "$pkgdir/usr/share/libalpm/hooks/90-secureboot.hook"
}

# vim:set ts=2 sw=2 et:
