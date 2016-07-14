# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>

pkgname='nitroshare'
pkgver='0.3.3'
_pkgseries='0.3'
pkgrel=2
pkgdesc='Network File Transfer Application'
url='https://nitroshare.net'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'qt5-tools' 'qt5-svg' 'cmake')
source=("https://launchpad.net/${pkgname}/${_pkgseries}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" "nitroshare.install")
sha256sums=('fa9385f9fd829bd4f91f2b3507676a94ec7bf107cfd085985ecee33fb6c88d4f'
            'c17bbd0717b92814eedbc273de2a43ac63286fdea7667ee9534e006bdbc0f1dc')
optdepends=('libappindicator-gtk2: export a menu into the Unity Menu bar' 'qhttpengine: allow local applications access')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 out/nitroshare "${pkgdir}/usr/bin/nitroshare"
}
