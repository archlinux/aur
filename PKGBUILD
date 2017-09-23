# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.4.3
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
sha1sums=('538f846e2dc67e7a946951ab421568658b50b27d')
sha256sums=('2060919b8a2bf9f3a3420bf6a8032424dde7038dac46d6ec3d8c360896254c5e')
sha512sums=('f1be7905516fc428b1a188eaf1400c074d617cf4c0435fb86be463a5abc79b7f6977af2ea1b66173777e8bdf19b4ae47f47695d50a4e3a7bd00d2aefd1b37a06')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
