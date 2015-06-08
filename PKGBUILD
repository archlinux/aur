# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Adria Arrufat <swiftscythe@gmail.com>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=gbacklight
pkgver=0.1
pkgrel=2
pkgdesc="Graphical frontend to xbacklight for adjusting the display brightness"
arch=('i686' 'x86_64')
url="http://code.google.com/p/gbacklight/"
license=("GPL")
depends=('libxrandr' 'gtk2')
source=("http://gbacklight.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha256sums=('9177f2cd5667b92b6a878b5b37f71b22feecf3ec037323d22ed892233629ad2e')

build() {
  cd ${pkgname}-${pkgver}

  ./configure --prefix=/usr
  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR=${pkgdir} install
}
