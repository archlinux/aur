# Maintainer: Julia DeMille <me@jdemille.com>
# Contributor: David <ottodavid@gmx.net>
pkgname=linvst
pkgver=4.7
pkgrel=1
license=('GPL3')
pkgdesc="Windows VST2 wrapper that allows them to be used as Linux VST2s in compatible DAWs using Wine."
arch=('x86_64')
url="https://github.com/osxmidi/LinVst"
depends=('wine')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/osxmidi/LinVst/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('96cf075eebb9db4d23f6fe7327b70496320f3d751e5ec24b7ffa3e29c750c8d1')

build() {
    cd "${srcdir}/LinVst-${pkgver}"
    make DESTDIR="${pkgdir}" all
}

package() {
    cd "${srcdir}/LinVst-${pkgver}"
    make DESTDIR="${pkgdir}" VST_DIR="${pkgdir}/usr/lib/vst/"  install
}
