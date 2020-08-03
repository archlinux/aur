# Maintainer: Manuel Pietschmann <mpi@cryonet.io>

pkgname=cryo
arch=('x86_64')
pkgver=0.5.18
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
optdepends=('tor' 'p7zip')
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
sha256sums_x86_64=('4486e0fd3826680d58721f62762aae032c966a97fb8e0421fd5bf92ab806f55b' '0ff1441a7e02bfebbaec994cf971607e11769806653b3c3ea3d45f90b6064964')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  rm -rf "${pkgdir}/opt/cryo/tor"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

