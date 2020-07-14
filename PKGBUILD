# Maintainer: Sebastien Leduc <sebastien@sleduc.fr>
# Contributor: Laurent Carlier <lordheavym@gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>
# Contributor: Scott Cassidy <scottlc@cpan.org>
# Contributor: Benjamin Robin <benjarobin>

pkgname=osmose
pkgver=0.9.98
pkgrel=1
pkgdesc="A Sega Master System / Gamegear console emulator"
arch=('i686' 'x86_64')
url="http://bcz.asterope.fr"
license=('GPL')
makedepends=('mesa')
depends=('qt5-base')
source=("https://codeload.github.com/lutris/osmose/zip/0.9.98"
        'osmose.desktop' 'osmose.png')

md5sums=('8f45406c806f051fa4e6bf5ec1b3c78f'
         '8189b6d17735eab45cace7723eb574f7'
         'ed9aed5b68cbe81bc69ede1893958750')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake
    make
}

package() {
    cd "$pkgdir"
    install -D -m755 ${srcdir}/${pkgname}-${pkgver}/osmose usr/bin/osmose
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/osmose.desktop usr/share/applications/osmose.desktop
    install -D -m644 ${srcdir}/${pkgname}-${pkgver}/osmose.png usr/share/pixmaps/osmose.png
}
