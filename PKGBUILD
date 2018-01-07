# $Id: PKGBUILD 104350 2014-01-18 18:59:49Z arodseth $
# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Brad Fanella <bradfanella@archlinux.us>
# Contributor: fnord0 <fnord0 AT riseup DOT net>

pkgname=python2-pylorcon
pkgver=2
pkgrel=4
_pyver=2.7
pkgdesc='Wrapper for the LORCON (Loss Of Radio CONnectivity) library'
arch=('any')
url='https://github.com/tom5760/pylorcon2'
license=('GPL2')
depends=("python2>=$_pyver" 'lorcon')
replaces=('pylorcon')
source=("pylorcon2.zip::https://github.com/tom5760/pylorcon$pkgver/zipball/master")
sha256sums=('b67bf17028188bccc94c127d161ed35bbf7a4209b88af97c2694e39ee2da6b0d')

build() {
  cd "tom5760-pylorcon2-aeb74d1/"
  sed -i '0,/on/s//on2/' lorcon.py
}

package() {
  cd "tom5760-pylorcon2-aeb74d1/"
  install -Dm644 lorcon.py \
    "$pkgdir/usr/lib/python2.7/site-packages/PyLorcon2.py"
}

# vim:set ts=2 sw=2 et:
