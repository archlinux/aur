# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=ft2tf
pkgver=0.9
pkgrel=2
epoch=
pkgdesc="Generates fbpad tinyfont files using libfreetype."
arch=('i686' 'x86_64')
url="http://litcave.rudi.ir"
license=('custom:BSD')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=${pkgname}.install
changelog=
source=("http://litcave.rudi.ir/${pkgname}-${pkgver}.tar.gz")
noextract=()
md5sums=('2d86896d96483fc13deb8ba995d0f127')
sha1sums=('61598487a4642e889837191739f90715a5cd474c')
sha256sums=('158b2669ffd3dde881123ad350e0da6b11f5f679c4b0d76e5c0a8a8ad294c01e')

build(){
  cd $srcdir/$pkgname-$pkgver
  make all
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 ft2tf $pkgdir/usr/bin/ft2tf
  install -Dm755 gen.sh $pkgdir/usr/share/doc/$pkgname/gen.sh
  install -Dm644 README $pkgdir/usr/share/doc/$pkgname/README
}

