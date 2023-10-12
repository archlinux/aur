# GI Jack: GI_Jack@hackermail.com

pkgname=fstransform
pkgver=0.9.3.patch1
pkgrel=1
pkgdesc="Tool for in-place filesystem conversion (for example from jfs/xfs/reiser to ext2/ext3/ext4) without backup "
arch=('x86_64' 'i686' 'pentium4')
url="https://github.com/cosmos72/fstransform"
license=('GPLv2')
depends=("dash")
source=("https://github.com/cosmos72/fstransform/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('82a93214e70fa44ea434b88a4ba4604f8793f0a891c0bb7ca03d8e25aebe5b72')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr --sbindir=/usr/bin --bindir=/usr/bin
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
