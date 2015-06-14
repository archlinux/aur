# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=pacmixer
pkgver=0.6.1
pkgrel=1
pkgdesc="alsamixer alike for PulseAudio."
arch=('i686' 'x86_64')
url="https://github.com/KenjiTakahashi/pacmixer"
license=('GPL3')
depends=(
    'ncurses'
    'libpulse'
    'gnustep-base'
)
makedepends=(
    'gcc-objc'
    'ninja'
)
source=("https://github.com/KenjiTakahashi/${pkgname}/archive/${pkgver}.tar.gz")
md5sums=('82373ff053b3497ebd82d4b1af55427e')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./mk
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" PREFIX="/usr" ./mk install
}
