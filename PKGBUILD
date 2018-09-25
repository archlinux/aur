# Maintainer: gbr <gbr@protonmail.com>
pkgname=gnethogs
pkgver=0.2
pkgrel=1
pkgdesc='GTK front-end for nethogs'
arch=('x86_64')
url='https://github.com/mbfoss/gnethogs'
license=('GPL')
depends=(
    'nethogs'
    'gtkmm3'
)
makedepends=(
    'intltool'
    'libxml2'
)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/mbfoss/gnethogs/archive/v${pkgver}.tar.gz")
sha1sums=('1a9f2eace9536745191836ad063cbd4bce12d117')
install=gnethogs.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
