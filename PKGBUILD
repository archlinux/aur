# Submitter: katoh <katoh_at_mikage.ne.jp>
#

pkgname=azpainter
pkgver=3.0.13
pkgrel=1
pkgdesc='Painting software'
arch=('i686' 'x86_64')
url='https://gitlab.com/azelpg/azpainter'
license=('GPL-3.0-only')
depends=('hicolor-icon-theme' 'fontconfig' 'libjpeg-turbo' 'libxi' 'libxcursor' 'libwebp' 'libtiff' 'libiconv')
makedepends=('ninja')
options=('!makeflags')
source=("https://gitlab.com/azelpg/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.bz2")
sha256sums=('bcb49521a5c03214f95a9950e15e2585b0127c88348b1ad279920fcfc0ad8512')

build() {
    cd "${pkgname}-v${pkgver}"
    ./configure --prefix=/usr
    cd build
    ninja
}

package() {
    cd "${pkgname}-v${pkgver}"
    cd build
    DESTDIR="${pkgdir}" ninja install
}
