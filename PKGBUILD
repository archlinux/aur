# Contributor: Andre Klitzing <aklitzing () gmail () com>

pkgname=msitools
pkgver=0.95
pkgrel=1
pkgdesc="Set of programs to inspect and build Windows Installer (.MSI) files"
arch=('i686' 'x86_64')
url="https://wiki.gnome.org/msitools"
license=('GPL')
depends=('libgsf' 'gcab')
makedepends=('intltool')
source=(http://ftp.gnome.org/pub/GNOME/sources/msitools/${pkgver}/${pkgname}-${pkgver}.tar.xz)

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make install DESTDIR="${pkgdir}"
}

sha256sums=('977ea3744cf091a19a8d06eae149fa9ab0d5cd078cc224e8da92bc05dcba66da')
