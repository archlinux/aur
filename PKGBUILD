# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=grap
pkgver=1.45
pkgrel=2
pkgdesc='A language for typesetting graphs.'
arch=('i686' 'x86_64')
url='https://packages.debian.org/sid/text/grap'
license=('custom')
depends=('gcc-libs')
source=("https://packages.debian.org/pool/main/g/$pkgname/${pkgname}_${pkgver}.orig.tar.gz")
sha512sums=('35e6a4e504aeb5649e74511d6e807506e71573e85fbea76cdd8e6b9c8d4b13ce02459bbc982f8b6abe898319f4560877df80c2f75300d152ac1bf76f81d9c15c')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/COPYRIGHT"
}
