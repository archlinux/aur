# Contributor: Colin Shea <colin@shea.at>
# Maintainer: Colin Shea <colin@shea.at>

pkgname=gdevilspie
pkgver=0.5
pkgrel=2
pkgdesc="pyGTK interface to devilspie"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gdevilspie"
license=('GPL')
depends=('pygtk' 'devilspie' 'python2-wnck' 'python2' 'python2-xdg')
makedepends=()
source=(http://gdevilspie.googlecode.com/files/$pkgname-$pkgver.tar.bz2
        xdg_basedirectory.patch)

md5sums=('aab8eecb47599467c65c77d3eddb2d5c'
         'e810b4c7371874931f234d2b8836d3eb')
sha256sums=('e03ab813e56b6dc6d868db7c318d280c9864cfa6e8a4ca84a5bb5d05542f55ff'
            'b8d287159b14a779c4fed525d010ad4a907eacd392e9409a2c199a4350342c89')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  mkdir -p $pkgdir/usr

  # Fix XDG & the she-bang
  patch -p1 -i $srcdir/xdg_basedirectory.patch

  python2 setup.py install --prefix $pkgdir/usr
}

# vim:set ts=2 sw=2 et:
