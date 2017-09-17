# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.3.11
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
sha1sums=('ebe10f008e63a54581a6bf0615d4b99c8f666688')
sha256sums=('9cb9589550295f0a65593faeed46b86717d814335d141dace740f44b67910cbe')
sha512sums=('c950bbba2931c476e708360ace407a78a7caea0cbf1d16631a89c00b0159c4bbbff15e81cafb6a3ec253e8c448aa63da58d0b8d3b3be74165246538103d8882d')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
