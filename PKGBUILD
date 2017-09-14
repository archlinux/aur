# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.3.10
pkgrel=1
pkgdesc='Encrypt LUKS volumes on system suspend'
arch=('x86_64')
url='https://github.com/guns/go-luks-suspend'
license=('GPL3')
depends=('systemd' 'cryptsetup' 'mkinitcpio')
makedepends=('go')
install=install
conflicts=('arch-luks-suspend' 'arch-luks-suspend-git')
source=("https://github.com/guns/$pkgname/archive/v$pkgver.tar.gz")
sha1sums=('66d1649160ce490e44e4434cf1d8cc5613d8ddc7')
sha256sums=('4c3a46cbfa8ceea418b85fc4f9baa0b8314c0fc6f0ce6a35fd70aa7cae4d12ee')
sha512sums=('3aa40cb9eebc9ae225f7ca9a7ac554e2da88ab6676404cb8489e38ca95e0c01c2c1d52863812290a6d0797e13debd701c5bae4fbee41e94c69e7bce937677a87')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
