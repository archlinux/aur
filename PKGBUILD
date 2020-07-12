# Maintainer: Alexander Rødseth <rodseth@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Geoffroy Carrier <geoffroy.carrier@koon.fr>

pkgname=gogh
pkgver=0.1.2.3
pkgrel=6
pkgdesc="Bitmap graphics editor for pressure-sensitive input devices"
arch=('any')
url="https://code.google.com/archive/p/gogh/"
license=('GPL')
depends=('pygtk' 'gnome-python' 'pyxml')
source=("https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/gogh/Gogh-${pkgver}.tar.gz")
sha256sums=('eff86a02dfd52347a5eb874e4a7d8a19c1fe10d66e08ebd1c64ff9ba24e532ab')

package() {
  cd "$srcdir/Gogh-$pkgver"

  python2 setup.py install --prefix="$pkgdir/usr"
  install -d "$pkgdir/usr/lib/python2.7/site-packages"
  cp -r brushlist.xml glade *.py "$pkgdir/usr/lib/python2.7/site-packages/"
}

# vim:set ts=2 sw=2 et:
