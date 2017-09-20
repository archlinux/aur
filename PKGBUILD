# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.4.0
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
sha1sums=('c8ac92dec2580c99abd9417d95e2c32ee3faf76f')
sha256sums=('12ea66d7422eeed5113f801701ec456a173cd6da17fc27ac7a57dff619fe4a44')
sha512sums=('3c10c47f80c749f2ec794e73d6820d24384b3e703116c3315a7510f090a837968861db082a55fe3ed67add7e0f5eb4ebfc1564870c217acadd7a0d73a8538ddb')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
