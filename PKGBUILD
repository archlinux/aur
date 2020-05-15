# Maintainer: Manuel Pietschmann <mpi@cryonet.io>

pkgname=cryo
arch=('x86_64')
pkgver=0.5.1
pkgrel=1
pkgdesc="A visual file manager with p2p file sharing"
url="https://cryonet.io"
license=('custom:"Copyright (c) Manuel Pietschmann"')
groups=()
depends=('hicolor-icon-theme'
         'tor'
         'libpng'
         'libexif'
         'libjpeg-turbo'
         'libsodium'
         'libraw'
         'sqlite')
makedepends=('xz')
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source_x86_64=("$pkgname-$pkgver-x86_64.deb::https://cryonet.io/downloads/linux/${pkgname}_${pkgver}_amd64.deb"
               "$pkgname-$pkgver-x86_64.deb.sig::https://cryonet.io/downloads/linux/${pkgname}_${pkgver}_amd64.deb.sig")
noextract=()
#validpgpkeys=('73A522A1186C411D275BA2E6483C615810DFCC8B')
sha256sums_x86_64=('90af9522cd8acb223c6517d3e14e77bc3e44423bc19b2f32aba2271f20c9d4ce'
                   '425bbf48e82a44386bd717e6418ebc9481da26b8321ab6136429b0b0b9060914')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  rm -rf "${pkgdir}/opt/cryo/tor"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

