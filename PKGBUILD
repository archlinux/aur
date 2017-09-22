# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.4.1
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
sha1sums=('2a52307f65c6e0734cf502a9a7803ceb85fdef39')
sha256sums=('1e6146b3caa365d924c818b204d05846a986080360436dd384f6dd1b45f042a9')
sha512sums=('7efe4be97fe8d2a4a00a9df998fe53d227918a42914f6da0ba68e341d0939788f58338684c9efc4bbd2e3664821dab8532d55663baea8e8ecf097a1bc969b0d6')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
