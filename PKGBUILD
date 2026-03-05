# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=5.0.2
pkgrel=1
pkgdesc='Calculate display info like DPI and aspect ratio'
arch=('i686' 'x86_64')
license=('GPL-3.0-or-later')
url="https://github.com/cassidyjames/dippi"
depends=(
    'gtk4'
    'glib2'
    'libadwaita'
    'hicolor-icon-theme'
)
makedepends=(
    'meson'
    'vala'
    'blueprint-compiler'
)
options=('!emptydirs')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/cassidyjames/${pkgname}/archive/${pkgver}.tar.gz")
b2sums=('f52bd71792dd06f01db514c9988066441ed3d62e77fc8b04d684c90fe76979ede8c76d7107ac40596804c9b55d1f96410b701770747c585a17a46d83f3200d34')

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
