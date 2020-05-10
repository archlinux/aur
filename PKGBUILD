# Maintainer: Rhinoceros <https://aur.archlinux.org/account/rhinoceros>
# Contributor: Sergio Montesinos <sermonpe@yahoo.es>

pkgname=lingot
pkgver=1.1.1
pkgrel=1
pkgdesc='A musical instrument tuner'
url='http://www.nongnu.org/lingot/'
license=('GPL')
arch=('i686' 'x86_64')
depends=('gtk3')
makedepends=('perl-xml-parser' 'intltool')
source=("https://download.savannah.gnu.org/releases/lingot/$pkgname-$pkgver.tar.gz")

sha256sums=('c4f97e496a3666c70786d136e6f2ccc5e8a3813eb08cda35cacd7eb0d16f4d56')

build() {
  cd "$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
