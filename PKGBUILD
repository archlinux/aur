# Maintainer: Sebastian Muxel <sebastian@muxel.dev>
# Contributor: Bernhard Walle <bernhard@bwalle.de>
# AUR Category: devel

pkgname=ptxdist
pkgver=2024.02.0
pkgrel=1
pkgdesc="Embedded Linux build system"
arch=('i686' 'x86_64')
url="http://www.ptxdist.org"
license=('GPL')
depends=('dialog' 'flex' 'bison' 'patch' 'python' 'wget')
source=("https://public.pengutronix.de/software/ptxdist/${pkgname}-${pkgver}.tar.bz2")
md5sums=('bf1e88644c3949707d95072c416a95f5')
sha256sums=('b862049f72894b1165212c192e682e329ec7485292a5a3a879c0b25b07c85f1e')
sha512sums=('3987e3aa5c7769964f2e634455a28a9813208080f5fb75c096443e0144b900a74fbaab6b28515e34cd36cc76c08cca97c768647cb925a131aeca7cc63acc93e2')

build() {
  cd "${pkgname}-${pkgver}"
  ./configure --prefix=/usr
  make -j
}

package() {
  cd "${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
