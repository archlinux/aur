# -*- Mode: shell-script -*-
# Maintainer: Roberto Mastri <rmastri@liceomalpighi.bo.it>
# Builder: lobisquit <enricolovisotto@gmail.com>

pkgname=webpatente
pkgver=4.4.13
pkgrel=1
pkgdesc="Practise to obtain Italian driving license"
arch=('i686' 'x86_64')
url="http://www.rmastri.it/"
license=(costum)

depends=("gtk2" "libxt" "dbus-glib" "alsa-lib" "desktop-file-utils")

source=("contrattodilicenzauf2014.pdf::https://www.rmastri.it/request.php?129")
source_i686=("$pkgname-$pkgver-i686.deb::https://www.rmastri.it/request.php?131")
source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://www.rmastri.it/request.php?139")

install=$pkgname.install

package () {
  ar x $pkgname-$pkgver-$CARCH.deb
  tar xvf $srcdir/data.tar.xz -C $pkgdir

  # fix permissions
  chmod -R 755 $pkgdir/usr/
  chmod -R 775 $pkgdir/usr/share/doc/webpatente/
  chmod -R 775 $pkgdir/usr/lib/webpatente/
  chmod -R 775 $pkgdir/usr/lib/mime/
}

md5sums=('418af5c47148aee9597fdc426edf2395')
md5sums_i686=('fddaabae0dacd0a207f2dbdb0a1c902c')
md5sums_x86_64=('d5cb9deca7f12891bf28ecf560cfcd24')
