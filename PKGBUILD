# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.3.8
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
sha512sums=('577a151b5bdc94bc3b7d25b879524e66949062f273131bdb0b07f81c6989727f89eba223988c672d073d1a8e5dcbc793bdeb4412f1cd2b23034759f97f9f716b')
sha256sums=('271b351004241500399c3f9256ecf65a3362977f7887f650f4cfce4c97f81b0e')
sha1sums=('b441120a0cb5c0ed54b3c60624536717e48a48d5')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
