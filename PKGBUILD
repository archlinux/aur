# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=pacmixer
pkgver=0.6.2
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
md5sums=('be2fb1a365427cf4e7a22e59e12b4c9b')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./mk
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" PREFIX="/usr" ./mk install
}
