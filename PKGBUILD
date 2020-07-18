# Maintainer: Manuel Pietschmann <mpi@cryonet.io>

pkgname=cryo
arch=('x86_64')
pkgver=0.5.14
pkgrel=1
pkgdesc="A visual file manager with p2p file transfers"
url="https://cryonet.io"
license=('custom:"Copyright (c) Manuel Pietschmann"')
groups=()
depends=('hicolor-icon-theme'
         'libpng'
         'libexif'
         'libjpeg-turbo'
         'libsodium'
         'libraw'
         'sqlite')
makedepends=('xz')
optdepends=('tor')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
source_x86_64=("$pkgname-$pkgver-$CARCH.deb::https://cryonet.io/downloads/linux/${pkgname}_${pkgver}_amd64.deb"
               "$pkgname-$pkgver-$CARCH.deb.sig::https://cryonet.io/downloads/linux/${pkgname}_${pkgver}_amd64.deb.sig")
noextract=()
#validpgpkeys=('73A522A1186C411D275BA2E6483C615810DFCC8B')
sha256sums_x86_64=('71f23e4ae0474a082ba19daebcf81a18ba92ae1beeb47c1c9fc10b0e6c92a6e1' 'd4d427b42cb761a983fce388213117950e70da34f28eb54315e4d47071cf0fa4')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  rm -rf "${pkgdir}/opt/cryo/tor"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

