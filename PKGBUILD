# Maintainer: Louis Tim Larsen (louis(a)louis.dk
# Contributor: Fernando Munoz
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>

# The files needed can be downloaded from
# https://www.fladnag.net/downloads/telephone/n900/

pkgname=flasher
pkgver=3.5_2.5.2.2
pkgrel=5
pkgdesc="Flasher utility for the Nokia N8X0 & N900"
arch=('i686' 'x86_64')
url="https://www.fladnag.net/downloads/telephone/n900/"
license=('Custom')
if [ $CARCH == "i686" ]; then   depends=('libusb-compat'); fi
if [ $CARCH == "x86_64" ]; then depends=('lib32-libusb-compat'); fi
source=(https://www.fladnag.net/downloads/telephone/n900/tools/maemo_flasher-3.5_2.5.2.2.tar.gz)
#source=(https://github.com/z/n900-notes/raw/master/tools/flasher-3.5/maemo_flasher-3.5_2.5.2.2.tar.gz)
#source=(https://ccr.chakralinux.org/packages/ma/maemo-flasher/maemo-flasher/maemo_flasher-3.5_2.5.2.2.tar.gz)
md5sums=('0daa9898360f83bcb10db73775e70785')

package() {
  cd "$srcdir/maemo_flasher-$pkgver"

  install -m755 -d $pkgdir/usr/{bin,share/man/man1,share/doc/flasher}
  install -m755 flasher-3.5 $pkgdir/usr/bin/flasher-3.5
  install -m644 man/man1/flasher-3.5.1 $pkgdir/usr/share/man/man1/flasher-3.5.1
  cp doc/* $pkgdir/usr/share/doc/flasher

}

# vim:set ts=2 sw=2 et:
