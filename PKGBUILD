# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>

pkgname=jpeg2png-git
pkgver=r144.04054a2
pkgrel=1
_abiver=5
pkgdesc='Finds the smoothest possible picture that encodes to the given JPEG file.'
arch=('x86_64' 'i686')
url='https://github.com/sandsmark/jpeg2png'
license=('GPL3')
depends=('libjpeg' 'libpng')
makedepends=('git')
conflicts=(jpeg2png)
provides=(jpeg2png)
source=('git+https://github.com/sandsmark/jpeg2png.git')
md5sums=('SKIP')

pkgver() {
    cd jpeg2png
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd jpeg2png
    make
}


package() {
    cd jpeg2png
    make DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/jpeg2png/LICENSE"
}
