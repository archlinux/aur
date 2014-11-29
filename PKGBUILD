# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>

pkgname=ttfsampler
pkgver=0.5
pkgrel=3
pkgdesc="A GUI and CLI utility that takes a list of TrueType fonts and generates a sample sheet in PDF"
arch=('i686' 'x86_64')
url="http://www.dlitz.net/software/ttfsampler/"
license=('GPL3')
depends=('python-reportlab' 'tk')
source=(http://ftp.dlitz.net/pub/dlitz/$pkgname/$pkgname-$pkgver.zip)
md5sums=('f625ebd9b29e5c6d1b81b05104b00929')

package() {
  cd "${srcdir}"/$pkgname-$pkgver

#Python2 fix
  for file in $(find . -name '*.py' -print); do
    sed -i 's_^#!.*/usr/bin/python_#!/usr/bin/python2_' $file
  done

  install -D -m755 gttfsampler.py "${pkgdir}"/usr/bin/gttfsampler
  install -D -m755 $pkgname.py "${pkgdir}"/usr/bin/$pkgname.py
}
