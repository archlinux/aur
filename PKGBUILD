# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-destruqtor-clap-bin'
pkgver='release_67'
pkgrel='1'
pkgdesc='companding distortion/saturation/exciter plugin.'
url="https://fx.amee.ee/plugin/destruqtor"
license=("custom:Potion Seller Public License")
source=(
    "https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/destruqtor-x86_64-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt"
)
sha256sums=('e4c7a1ff6191aaf36bc5a243444108076639628114068291ff2d4b22086efc8a'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/destruqtor-x86_64-unknown-linux-gnu.clap" "${pkgdir}/usr/lib/clap/destruqtor.clap"
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
