# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=grap
pkgver=1.45
pkgrel=1
pkgdesc='A language for typesetting graphs.'
arch=('i686' 'x86_64')
url='http://www.lunabase.org/~faber/Vault/software/grap/'
license=('custom')
depends=('gcc-libs')
source=("http://www.lunabase.org/~faber/Vault/software/$pkgname/$pkgname-$pkgver.tar.gz")
md5sums=('bfcebd45d734c56eebba7948b95c3f2d')

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
