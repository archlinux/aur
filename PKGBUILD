# Maintainer: Laurens Hazewinkel <laurens dot hazewinkel at gmail dot com>
pkgname=bs2b-lv2
pkgver=1.0.0
pkgrel=1
pkgdesc="A lv2 plugin for using Bauer stereophonic-to-binaural DSP library"
arch=('x86_64')
url="https://github.com/nilninull/bs2b-lv2"
license=('GPL2')
depends=('lv2' 'libbs2b')
source=("https://github.com/nilninull/bs2b-lv2/archive/v${pkgver}.tar.gz")
sha256sums=('951f1332a5f49711f394cfdd17fadfba5410a3d102c97e9dda46f2c6ba08d0eb')

build() {
	cd "${pkgname}-${pkgver}"
	./waf configure --prefix="/usr/"
	./waf build
}

package() {
	cd "${pkgname}-${pkgver}"
	./waf install --destdir="${pkgdir}"
}
