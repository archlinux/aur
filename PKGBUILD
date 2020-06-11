# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=grap
pkgver=1.46
pkgrel=1
pkgdesc='A language for typesetting graphs.'
arch=('i686' 'x86_64')
url="https://www.lunabase.org/~faber/Vault/software/${pkgname}"
license=('custom')
depends=('gcc-libs')
source=("https://www.lunabase.org/~faber/Vault/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('ee7fa32c0354ff1fb01aba63c180277f8e5f43933dd52c2b6a209bbd429ee97856b629611a84f6c9394b90f9538a11134e48b32f2b2c5b9823e606f03476a8a0')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
}
