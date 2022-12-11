# Maintainer: David Maseda <david.maseda@hotmail.com>
pkgname=zxtext2p
pkgver=V1.0
pkgrel=1
pkgdesc="Command line utility that takes a BASIC source file and turns it into .P for ZX81"
arch=(x86_64)
url="http://freestuff.grok.co.uk/zxtext2p/index.html"
license=('GPL')
groups=()
depends=(glibc)
makedepends=(gcc)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=($pkgname-$pkgver.zip::http://freestuff.grok.co.uk/zxtext2p/$pkgname.zip)
noextract=()
md5sums=() #autofill using updpkgsums

#prepare() {
#  unzip $pkgname-$pkgver.zip -d "$pkgname-$pkgver"
#}
build() {
  gcc -lm  -Wl,-z,relro,-z,now $pkgname.c -o $pkgname
}

package() {
  mkdir -p $pkgdir/usr/bin
  cp $pkgname $pkgdir/usr/bin
}
sha256sums=('ce9ce3c3d4d7992de7db7a12dd5fc7d322637cbaabd2b1c360aca4c743886dd4')
