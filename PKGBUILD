# Maintainer: guns <self@sungpae.com>
# Contributor: Vianney le Clément de Saint-Marcq <vleclement AT gmail·com>
pkgname=go-luks-suspend
pkgver=1.3.9
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
sha1sums=('e652d024c7aa64d60f248b10a5c9732310d1bb23')
sha256sums=('d608c7a4cad9c579db88de7bbe5d00789cbcbc201daf3fde8551985b2f6ba074')
sha512sums=('eda0106927153da4fa0030f15028e2095d7bd8acbc415602e1efa532eee72560cec8349609200cc45212dba4e3dc8b0ae2f5fcb06b98ea7f79e1a9594f90094b')

build() {
  cd "$pkgname-$pkgver"

  make clean all
}

package() {
  cd "$pkgname-$pkgver"

  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
