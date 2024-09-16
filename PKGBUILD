# Maintainer: malet
pkgname=dafny-bin
_pkgname=dafny
pkgver=4.8.1
pkgrel=1
pkgdesc="Dafny is a verification-aware programming language"
arch=('x86_64')
url="https://github.com/dafny-lang/dafny"
license=('MIT')
provides=('dafny')
conflicts=('dafny')
depends=('dotnet-runtime')
options=('staticlibs')
source=(dafny-${pkgver}.zip::https://github.com/dafny-lang/dafny/releases/download/v${pkgver}/dafny-${pkgver}-x64-ubuntu-20.04.zip)
sha256sums=('3e051bbf32e8da40a4e702815bfd719f6124cb29b38a6f8b32465e7e30d0ea55')

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
