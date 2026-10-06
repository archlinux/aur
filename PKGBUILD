# Maintainer: Sebastian Muxel <sebastian@muxel.dev>

pkgname='blepfx-destruqtor-clap-bin'
pkgver='release_128'
pkgrel='1'
pkgdesc='companding distortion/saturation/exciter plugin.'
url="https://fx.amee.ee/plugin/destruqtor"
license=("custom:Potion Seller Public License")
source=(
    "https://github.com/blepfx/dist/releases/download/${pkgver//_/-}/destruqtor-x86_64-unknown-linux-gnu.zip"
    "LICENSE::https://raw.githubusercontent.com/blepfx/dist/refs/heads/main/LICENSE.txt"
)
sha256sums=('1ca5d8051c5953bc42a2ef3107c7b3fe98bbaf38e336a0ac4d4afa2893de7853'
            '1cba06d144eb15023d17c4f41ff04ec404bb19550cec408f72373effdb6463ed')
arch=('x86_64')
options=(strip !debug)

package() {
    mkdir -p "${pkgdir}/usr/lib/clap/"
    mv "${srcdir}/destruqtor.clap" "${pkgdir}/usr/lib/clap/destruqtor.clap"
    install -Dm644 ${srcdir}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
