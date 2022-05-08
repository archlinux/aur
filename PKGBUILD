# Maintainer: François Guerraz <kubrick@fgv6.net>
pkgname=snaphu
pkgver=2.0.5
pkgrel=1
pkgdesc="Statistical-Cost, Network-Flow Algorithm for Phase Unwrapping"
arch=('x86_64')
url="https://web.stanford.edu/group/radar/softwareandlinks/sw/snaphu/"
license=('custom')
groups=()
depends=( )
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=( "https://web.stanford.edu/group/radar/softwareandlinks/sw/snaphu/$pkgname-v$pkgver.tar.gz" ) 
noextract=( )
sha256sums=( 'ad3917de3efa7b86bb31c5cfeb612a4759ad53de16e8875c9899f58d20ddd571')

prepare() {
  cd ${pkgname}-v${pkgver}
}

build() {
  cd ${pkgname}-v${pkgver}/src/
  make
}

package() {
  cd ${pkgname}-v${pkgver}/src/
  mkdir -p ${pkgdir}/usr/bin/ ${pkgdir}/usr/man/man1
  make INSTALLDIR=${pkgdir}/usr/bin/ MANDIR=${pkgdir}/usr/man/ install
  install -D -t ${pkgdir}/usr/share/licenses/snaphu/ ${srcdir}/${pkgname}-v${pkgver}/README
}

