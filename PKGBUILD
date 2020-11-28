# Maintainer: mrabe89 <mrabe@hatdev.de>
pkgname="secureboot.sh"
pkgdesc='A very basic script to setup secureboot'

pkgver=0.0.1
pkgrel=2

arch=('x86_64')
url='https://github.com/mrabe89/secureboot.sh'
license=('GPL')

depends=('systemd' 'dracut' 'efitools' 'sbsigntools')

source=("$pkgname-$pkgver.tar.gz::https://github.com/mrabe89/${pkgname}/archive/v$pkgver.tar.gz")
sha256sums=("1e32809a0c4c3646e72719c8a553fa0310fa3094c8224012dbbb6a333756b18a")

package() {
  cd "$srcdir/$pkgname-$pkgver/"
  install -D -m 700 "secureboot.sh"   "$pkgdir/usr/bin/secureboot.sh"
  install -D -m 644 "secureboot.hook" "$pkgdir/usr/share/libalpm/hooks/90-secureboot.hook"
}

# vim:set ts=2 sw=2 et:
