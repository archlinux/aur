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
sha256sums=('SKIP')

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
