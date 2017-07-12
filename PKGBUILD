# Maintainer: Frederik Schwan <frederik dot schwan at linux dot com>

pkgname=libpurple-lurch
pkgver=0.6.5
pkgrel=1
pkgdesc='Plugin for libpurple (Pidgin, Adium, etc) implementing OMEMO (using axolotl)'
arch=('i686' 'x86_64')
url='https://github.com/gkdr/lurch'
license=('GPL')
depends=('libpurple' 'mxml' 'libxml2' 'sqlite' 'libgcrypt')
optdepends=('libpurple-carbons-git: message carbons support')
conflicts=('libpurple-lurch-git')
source=(https://github.com/gkdr/lurch/releases/download/v${pkgver}/lurch-${pkgver}-src.tar.gz)
sha512sums=('c0ff968935254e8cf7e039a843476fa5a4cc8d725c1eeb3e4f66932efada84232f03d6c7bbe3dc0466205a9554247fd1937e4ab4c9658c23ece6728b7277460f')

build() {
    cd "${srcdir}"
    make
}

package() {
    cd "${srcdir}"
    make DESTDIR="${pkgdir}" install
}
