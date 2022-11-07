# Maintainer: Filipe Nascimento <flipee at tuta dot io>
# Contributor: Morten Linderud <foxboron@archlinux.org>

pkgname=smenu
pkgver=1.1.0
pkgrel=1
pkgdesc="A powerful and versatile selection tool for interactive or scripting use"
arch=('x86_64')
url="https://github.com/p-gen/smenu"
license=('GPL')
depends=('ncurses')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/p-gen/smenu/archive/v${pkgver}.tar.gz")
sha256sums=('51cefc670d5030b2728719520244ad48dc3e160ed7168745c4fad719491bd7cd')

build() {
    cd "${pkgname}-${pkgver}"
    ./configure --prefix="/usr"
    make
}

package() {
    cd "${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" PREFIX=/usr install
}
