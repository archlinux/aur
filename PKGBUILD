# https://github.com/ansemjo/mkefikeys

pkgname=mkefikeys
pkgdesc="Generate signing keys and authenticated efivar updates for SecureBoot systems."

pkgver=0.1.0
pkgrel=1

arch=('any')
url="https://github.com/ansemjo/$pkgname"
license=('MIT')

depends=('systemd' 'bash' 'make' 'openssl' 'util-linux' 'efitools')
makedepends=('make')

provides=($pkgname)
conflicts=($pkgname)

source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=("ec2e43772195bdee471ea45b8a8acad9a9d144a590443caf416cfbdce616908f")

package() {
  cd "$pkgname-$pkgver/"
  make -f install.mk DESTDIR="$pkgdir/" install
}
