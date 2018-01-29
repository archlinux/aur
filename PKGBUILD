# Contributor: Holger Rauch < holger dot rauch at posteo dot de >
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: Nathan Owe <ndowens04+AUR@gmail.com>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

pkgname=grap
pkgver=1.45
pkgrel=3
pkgdesc='A language for typesetting graphs.'
arch=('i686' 'x86_64')
url="https://www.lunabase.org/~faber/Vault/software/${pkgname}/${pkgname}-${pkgver}.tar.gz"
license=('custom')
depends=('gcc-libs')
source=("https://www.lunabase.org/~faber/Vault/software/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e23a5dda5d68140cab860f076f432785cf5d78f51ee09ba6f90cea3de9901066f61867db9fa84a1e09f2a4763083bfb4e16199cc0fdafbf39fcb5605c8b7ce96')

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
