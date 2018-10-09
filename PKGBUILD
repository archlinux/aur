# Maintainer: Ankit R Gadiya <arch@argp.in>
# Contributor: Christian Hesse <mail@eworm.de>

pkgname=sent
pkgver=1
pkgrel=4
pkgdesc='Simple plaintext presentation tool'
arch=('i686' 'x86_64')
url='http://tools.suckless.org/sent'
depends=('libxft' 'fontconfig' 'libpng')
optdepends=('farbfeld: Image support')
license=('custom:ISC')
source=("https://dl.suckless.org/tools/${pkgname}-${pkgver}.tar.gz"
        "config.h")
sha256sums=('7bf3de9311ce291ff36adf5315b78fa72373e3ab80ca71387fb5884bcbd7be33'
            '5b93e790d607389a4966595cb32a818f6f076605aff52d9a87f54b4587e4d79e')

# prepare() {
#     cp config.h "${srcdir}/config.h"
# }

build() {
    cd "${srcdir}"
    make
}

package() {
    cd "${srcdir}"
    make DESTDIR="${pkgdir}" PREFIX='/usr/' install

    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
