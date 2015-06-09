# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=touchegg
pkgver=1.1.1
pkgrel=3
pkgdesc="Multitouch gesture recognizer"
arch=(i686 x86_64)
url="https://code.google.com/p/touchegg/"
license=(GPL)
depends=(qt4 geis)
source=("http://${pkgname}.googlecode.com/files/${pkgname}-${pkgver}.tar.gz")
sha512sums=('9a7e89946f2c5fc9be9eff0fef3d79151a6fbc89dbb964bf52f8a67123cecd2549723f8f90e1c06c1a1cb3bfd76551524d812d00317945466091538563072551')

build() {
  cd "${pkgname}-${pkgver}"

  # Cannot build with default compiler/linker flags
  unset CXXFLAGS CFLAGS LDFLAGS
  qmake-qt4
  make -j1
}

package() {
  cd "${pkgname}-${pkgver}"
  make INSTALL_ROOT="${pkgdir}" install
}
