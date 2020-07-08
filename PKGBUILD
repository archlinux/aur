# Maintainer: Manuel Pietschmann <mpi@cryonet.io>

pkgname=cryo
arch=('x86_64')
pkgver=0.5.10
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
sha256sums_x86_64=('da1950a3e61b0d714cca18c2058a33f7266eefc5aa17b8c0275a315d56024f95' '6527ea42a977da4e52f0739e15564172e61f4be29453a1be561444ecd35b916b')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  rm -rf "${pkgdir}/opt/cryo/tor"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

