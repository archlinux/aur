# GI Jack: GI_Jack@hackermail.com

pkgname=fstransform
pkgver=0.9.4
pkgrel=1
pkgdesc="Tool for in-place filesystem conversion (for example from jfs/xfs/reiser to ext2/ext3/ext4) without backup "
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/cosmos72/fstransform"
license=('GPLv2')
depends=("dash")
source=("https://github.com/cosmos72/fstransform/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('6fa5f27711ed7a00a0ccf1ffa0b9e2541e67c8e91451fc95e44c010de4443a6f')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin --bindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
