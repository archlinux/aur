# Maintainer: Luc Saccoccio--Le Guennec <lucsaccoccio@disroot.org>
pkgname=zamonia-bin
pkgver=0.1.0.0
pkgrel=1
pkgdesc="Zamonia - Executable only - CLI tool to manage work database"
url="https://github.com/Luc-Saccoccio/zamonia"
license=(custom)
arch=('x86_64')
depends=('gmp')
conflicts=()
provides=()
replaces=()
optdepends=()

# The binary release doesn't have the datafiles, so we need to yoink those out of the source tarball, too.
source=("$pkgname-$pkgver.tar.gz::https://github.com/Luc-Saccoccio/zamonia/releases/download/v${pkgver}/zamonia-${pkgver}.tar.gz")

sha512sums=('32a95f19ef8bdd8dde5e0e442cf3368067bc991c56bd274c8c22080e459c7e9841fa36ef88db09e128edbce4d3cd5a7922f5cf4e664fca91bbaee90b8692c716')

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"
  cp LICENSE "$pkgdir/usr/share/licenses/$pkgname"
  cp zamonia "${pkgdir}/usr/bin"
}
