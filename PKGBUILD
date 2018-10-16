# Maintainer: Anton Semjonov < a**** \ät semjonov.de >

pkgname="mkefikeys"
pkgdesc="Generate signing keys and authenticated efivar updates for SecureBoot systems."

pkgver=0.0.2
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('systemd' 'bash' 'make' 'openssl' 'util-linux' 'efitools')
makedepends=('make')

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('c045ac1995f06d71491b201778d3137803dbe93a682d19661b9e9ac550cfdf78')

package() {
  cd "$pkgname-$pkgver/"
  make -f install.mk DESTDIR="$pkgdir/" install
}
