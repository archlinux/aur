# Maintainer Ciro Sanchez <cirodario37@gmail.com>
pkgname='sysex-controls'
pkgver=0.2.27
pkgrel=1
arch=('x86_64')
pkgdesc="Linux alternative to the MIDI Control Center software"
url="https://github.com/soyersoyer/sysex-controls"
license=('GPL-3.0-only')
depends=('gtk4' 'libadwaita' 'alsa-lib' 'glibc' 'gcc-libs' 'dconf' 'hicolor-icon-theme' 'glib2')
makedepends=('meson' 'gcc' 'git' 'ninja')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b4cd4593b4e91478b01229218c1d26dd58f7639e2c1bd6e795d62add56a9cae8')

build() {
    cd "${pkgname}-${pkgver}"
    arch-meson builddir
    meson compile -C builddir
}

package() {
    cd "${pkgname}-${pkgver}"
    DESTDIR="$pkgdir" meson install -C builddir
}
