# Maintainer: BrainDamage

pkgname=midimonster
pkgver=0.6
pkgrel=2
pkgdesc="universal control and translation tool for multi-channel absolute-value-based control and/or bus protocols"
arch=('x86_64')
url="https://midimonster.net/"
license=('BSD')
depends=('alsa-lib' 'libevdev' 'lua' 'jack')
source=("https://github.com/cbdevnet/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('69d4450e1f341975b79b248931a6d4f959f1f979f8845e4eb4ffc179b6de9ae4')
backup=("etc/${pkgname}/${pkgname}.cfg")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make PLUGINS="/usr/lib/${pkgname}" DEFAULT_CFG="/etc/${pkgname}/${pkgname}.cfg"
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" DEFAULT_CFG="/etc/${pkgname}/${pkgname}.cfg" install
}
