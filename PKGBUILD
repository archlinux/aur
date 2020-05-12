# Maintainer: Manuel Pietschmann <mpi@cryonet.io>

pkgname=cryo
arch=('x86_64')
pkgver=0.5.0
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
sha256sums_x86_64=('1f5eb1a8b5d850d16643b8924b1a627c76af51806005f034290f45aab924501b'
                   '5d6420ddd74c5b19965bc987271209912c0eab427c4a603465036d3065b5f6c8')

package() {
  cd "${srcdir}"

  tar -xJf data.tar.xz -C "${pkgdir}"

  chown -R root:root "${pkgdir}"
  rm -rf "${pkgdir}/opt/cryo/tor"

  # Remove group write permissions from all files/directories
  chmod -R g-w "${pkgdir}"
}

