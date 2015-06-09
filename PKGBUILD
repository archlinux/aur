# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=pacmixer
pkgver=0.6
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
md5sums=('2729f4fadcbce866e7b69b05a6f565f0')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./mk
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" PREFIX="/usr" ./mk install
}
