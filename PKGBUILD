# Maintainer: ZephyrDRH <zephyrdrh at gmx dot de>
# Contributor: Andrew Sun <adsun701 at gmail dot com>
# Contributor: ELmoussaoui Bilal <bil dot elmoussaoui at gmail dot com>

pkgname=dippi
pkgver=5.0.4
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
b2sums=('a08a6902ffef581115ab5685c4940b13adfa27faecd221fe5fe7a2ad8c552dd284363affc50985e934e5637fa7df618ed6ea2d320e32676c825245c0cb6b0352')

build() {
  arch-meson "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/build"
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C "${srcdir}/build"
}
