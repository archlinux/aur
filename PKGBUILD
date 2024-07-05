# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=flips
# Each commit to master should be treated as a release as per upstream recommendation.
pkgver=181
_commit=e12ef189900b2c720c6dcd55036a8bb43925ea53
pkgrel=1
pkgdesc="Patcher for IPS and BPS files"
depends=('at-spi2-core' 'cairo' 'gcc-libs' 'gdk-pixbuf2' 'glibc' 'glib2' 'gtk3'
         'harfbuzz' 'hicolor-icon-theme' 'pango' 'zlib')
makedepends=('git')
arch=('x86_64')
url="https://github.com/Alcaro/Flips"
license=('GPL-3.0-or-later')
source=("flips::git+https://github.com/Alcaro/Flips.git#commit=$_commit")
sha256sums=('SKIP')

build() {
    cd "${srcdir}"/$pkgname
    make
}

package() {
    cd "${srcdir}"/$pkgname
    make DESTDIR="${pkgdir}" install
    install -Dm644 COPYING "${pkgdir}"/usr/share/licenses/$pkgname/COPYING
    install -Dm644 COPYING.gpl3 "${pkgdir}"/usr/share/licenses/$pkgname/COPYING.gpl3
}
