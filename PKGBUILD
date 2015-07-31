# Maintainer: Karol "Kenji Takahashi" Woźniak <kenji.sx>
# Contributor: Rolinh <robinDOThahlingATgw-computingDOTnet>

pkgname=tagutil
pkgver=3.0.2
pkgrel=1
pkgdesc="scriptable music files tags tool and editor"
arch=('i686' 'x86_64')
url="https://github.com/kAworu/tagutil"
license=('BSD')
depends=(
    'libyaml'
    'taglib'
    'flac'
    'libvorbis'
    'jansson'
)
makedepends=(
    'cmake'
)
options=(!emptydirs)
source=("${url}/archive/v${pkgver}.tar.gz")
md5sums=('5d434c7aa174b8d4a1b76e01b8bcd2a1')

build() {
    cd "${pkgname}-${pkgver}"

    cmake . -DPREFIX=/usr -DCMAKE_BUILD_TYPE=RELEASE
    make
}

package() {
    cd "${pkgname}-${pkgver}"

    make DESTDIR="${pkgdir}" install
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/"${pkgname}"/LICENSE"
}

# vim:set ts=4 sw=4 et:
