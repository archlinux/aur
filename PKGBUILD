# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>

pkgname='nitroshare'
pkgver='0.3.0'
_pkgseries='0.3'
pkgrel=2
pkgdesc='Network File Transfer Application'
url='http://nitroshare.net'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-svg' 'qt5-base')
source=("https://launchpad.net/${pkgname}/${_pkgseries}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" "nitroshare.install")
sha256sums=('b5e53c37c802120d01e829c639be2ff88893bfa5b1558b8841da962dc2588236'
            'c17bbd0717b92814eedbc273de2a43ac63286fdea7667ee9534e006bdbc0f1dc')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    qmake-qt5
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    INSTALL_ROOT="${pkgdir}/usr/" make install
}
