# Maintainer: malet
pkgname=dafny-bin
_pkgname=dafny
pkgver=3.7.2
pkgrel=1
pkgdesc="Dafny is a verification-aware programming language"
arch=('x86_64')
url="https://github.com/dafny-lang/dafny"
license=('MIT')
provides=('dafny')
conflicts=('dafny')
depends=('dotnet-runtime')
options=('staticlibs')
source=(dafny-${pkgver}.zip::https://github.com/dafny-lang/dafny/releases/download/v${pkgver}/dafny-${pkgver}-x64-ubuntu-16.04.zip)
sha256sums=('722afea587d85cc099280b3ad996c80e4a0908ab4173849f41735b82e1f83636')

package() {
  cd ${_pkgname}

  # Creating directories
  install -dm755 $pkgdir/opt/dafny
  install -dm755 $pkgdir/usr/bin

  # Install binary
  install -Dm755 "${srcdir}"/dafny/dafny "${pkgdir}"/opt/dafny/dafny
  # Copy dependencies
  cp -r "${srcdir}"/dafny/* "${pkgdir}"/opt/dafny/
  ln -s /opt/dafny/dafny "${pkgdir}"/usr/bin/dafny
}
