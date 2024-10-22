# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>

pkgname=pacmixer
pkgver=0.6.4
pkgrel=2
pkgdesc="alsamixer alike for PulseAudio."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/KenjiTakahashi/pacmixer"
license=('GPL-3.0-or-later')
depends=(
    'ncurses'
    'libpulse'
    'gnustep-base'
)
makedepends=(
    'gcc-objc'
    'gnustep-make'
    'ninja'
)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/KenjiTakahashi/${pkgname}/archive/${pkgver}.tar.gz")

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./mk
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    DESTDIR="${pkgdir}" PREFIX="/usr" ./mk install
}
sha256sums=('81f597c9ab4e5ed60750f28f82eeb1708ecdbcee6fdc3ebaceb43a0f06bd0214')
