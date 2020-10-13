# Maintainer: Charalampos Kardaris <ckardaris at outlook dot com>

pkgname=ucollage
pkgver=0.1.0
pkgrel=2
pkgdesc="A command line image viewer based on Überzug."
arch=('any')
url="https://github.com/ckardaris/ucollage"
license=('GPL3')
depends=('bash>=4.2.0' 'ueberzug' 'file')
optdepends=(
  'imagemagick: Image rotation'
  'ffmpeg: Thumbnail creation'
)
source=("https://github.com/ckardaris/ucollage/archive/v${pkgver}.tar.gz")
sha256sums=('5fab56577e3429bd28f36e26138d6ecd3c2f91833a94da9cc35de75710588f7b')

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm755 ucollage -t "${pkgdir}/usr/bin"
    install -Dm644 README.md -t "${pkgdir}/usr/share/doc/${pkgname}"
    gzip ucollage.1
    install -Dm644 ucollage.1.gz -t "${pkgdir}/usr/share/man/man1"
}
