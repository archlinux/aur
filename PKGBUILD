# Contributer: Bartlomiej Piotrowski <nospam@bpiotrowski.pl>
# Maintainer: Samuel Walladge <swalladge at gmail dot com>

pkgname=vimprobable2
pkgver=1.4.2
pkgrel=1
pkgdesc='Web browser that behaves like Vimperator'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/vimprobable/'
license=('MIT')
depends=('libwebkit' 'gtk2' 'libsoup')
source=(http://downloads.sourceforge.net/sourceforge/vimprobable/Releases/${pkgname}_${pkgver}.tar.bz2)
md5sums=('4b7b757043e448e9284942b38dcc43cf')

build() {
  cd $pkgname

  # for custom configuration at compile-time
  # [ -e $srcdir/config.h ] && cp $srcdir/config.h .
  # [ -e $srcdir/keymap.h ] && cp $srcdir/keymap.h .

  make
}

package() {
  cd $pkgname
  make PREFIX=/usr MANDIR=/usr/share/man DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

