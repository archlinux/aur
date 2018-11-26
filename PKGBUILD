# Maintainer: malet
pkgname=dafny-bin
_pkgname=dafny
pkgver=2.2.0
_pkgbuild=10923
pkgrel=1
pkgdesc="Dafny is a verification-aware programming language"
arch=('x86_64')
url="https://github.com/Microsoft/dafny"
license=('MIT')
provides=('dafny')
conflicts=('dafny')
depends=('mono')
source=(dafny-${pkgver}.${_pkgbuild}.zip::https://github.com/Microsoft/dafny/releases/download/v${pkgver}/dafny-${pkgver}.${_pkgbuild}-x64-debian-8.5.zip)
sha256sums=('4b13238739d04897517b87ee5300efd99589d6f9b7b59d811624fde8f2f9786d')

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
