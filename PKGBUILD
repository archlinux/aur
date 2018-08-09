# Maintainer: fordprefect <fordprefect@dukun.de>
# former Contributors: Daenyth, Giovanni Scafora, Tino Reichardt 

pkgname=vobcopy
pkgver=1.2.0
_debianver=7
pkgrel=6
pkgdesc='Copies DVD .vob files to harddisk, decrypting them on the way'
arch=('i686' 'x86_64')
url="https://github.com/barak/vobcopy"
license=('GPL2')
depends=('libdvdread' 'libdvdcss')
options=('!docs')
source=("$pkgname-$pkgver-$_debianver.tar.gz::https://github.com/barak/vobcopy/archive/debian/$pkgver-$_debianver.tar.gz")
md5sums=('7337922485bdf76f7b9ecd76989042e6')

build() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}-$_debianver"
  make
}

package() {
  cd "${srcdir}/${pkgname}-debian-${pkgver}-$_debianver"
  make DESTDIR="$pkgdir" PREFIX=/usr/ MANDIR=/usr/share/man install
}

# vim:set ts=2 sw=2 et:
