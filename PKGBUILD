# Maintainer: Sid Karunaratne <sid at karunaratne dot net>
# Contributor: Nathan Osman <nathan at quickmediasolutions dot com>

pkgname='nitroshare'
pkgver='0.3.1'
_pkgseries='0.3'
pkgrel=1
pkgdesc='Network File Transfer Application'
url='http://nitroshare.net'
arch=('i686' 'x86_64')
license=('MIT')
depends=('qt5-base' 'cmake')
source=("https://launchpad.net/${pkgname}/${_pkgseries}/${pkgver}/+download/${pkgname}-${pkgver}.tar.gz" "nitroshare.install")
sha256sums=('bb7cd39ff73a62500df35415b5fe314676972f684188ea23bb6caa24dee64e31'
            'c17bbd0717b92814eedbc273de2a43ac63286fdea7667ee9534e006bdbc0f1dc')
optdepends=('libappindicator-gtk2: export a menu into the Unity Menu bar')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake .
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    install -Dm 755 out/nitroshare "${pkgdir}/usr/bin/nitroshare"
}
