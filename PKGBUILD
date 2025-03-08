# Maintainer: Ken Mitton <mittonk at alum dot mit dot edu>

pkgname=dice-emu
pkgver=0.9a
pkgrel=2
pkgdesc='Discrete Integrated Circuit Emulator (DICE) for TTL-based arcade games like Pong.'
arch=('x86_64')
url='https://github.com/DirtBagXon/DICE'
license=('GPL-3.0-or-later')
depends=('qt5-base' 'sdl2')
makedepends=()
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/DirtBagXon/DICE/archive/refs/tags/0.9a.tar.gz")
sha256sums=('f1f6d742dc713dff7e89b4f6b0c61404a278dd12e0243bfe2255f4531a18d719')

build() {
    cd "${srcdir}/DICE-${pkgver}"

    make
}

package() {
    install -Dm755 ${srcdir}/DICE-${pkgver}/dice ${pkgdir}/usr/bin/dice
}
