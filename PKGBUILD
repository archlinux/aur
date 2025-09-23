# Maintainer: Alexander 'chron' Kempen <chron@posteo.de>
pkgname=mmt
pkgver=2.0
pkgrel=1
pkgdesc="Media management tool for GoPros and other action cameras"
arch=('x86_64')
url="https://github.com/KonradIT/mmt"
license=()
groups=()
depends=('ffmpeg')
makedepends=('go')
optdepends=()
provides=('mmt')
conflicts=('mmt-bin')
replaces=('mmt-bin')
backup=()
options=(!debug)
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
b2sums=('1fdec29c1759ce45b099e6c154d8f3cc0ce62fc067235c74ac4029050d33c4a118ce013eb29a969c9dc3b84088793b1a7692244d31f7d036812aef9391317cab')

prepare() {
  cd "${srcdir}"
  tar -xf "${pkgname}-${pkgver}.tar.gz"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  go build
}

package() {
  install -Dm755 "${srcdir}/${pkgname}-${pkgver}/${pkgname}" "${pkgdir}/usr/bin/mmt"
}
