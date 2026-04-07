# Maintainer: Ciro Sanchez <cirodario37@gmail.com>
pkgname='sysex-controls'
pkgver=0.2.28
pkgrel=2
arch=('x86_64')
pkgdesc="Linux alternative to the MIDI Control Center software"
url="https://github.com/soyersoyer/sysex-controls"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'alsa-lib')
makedepends=('meson' 'gcc' 'git' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb358d311b5a36487ad671b7e078f17bee39363a6df56175027a7cb5661a3439')

build() {
    cd "${pkgname}-${pkgver}"
    arch-meson builddir
    meson compile -C builddir
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" meson install -C builddir
}
