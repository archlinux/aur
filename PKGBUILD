# Maintainer: Maikel Llamaret Heredia <llamaret@webmisolutions.com>

pkgname=mystiq
_pkgname=MystiQ
pkgver=0.4.0
pkgrel=1
pkgdesc="FFmpeg GUI front-end based on Qt5."
arch=('x86_64')
url="https://mystiq.swlx.info/"
license=('GPL3')
depends=('qt5-declarative' 'qt5-multimedia' 'ffmpeg' 'libnotify' 'sox')
makedepends=('qt5-tools')
replaces=('qwinff')
source=("https://github.com/llamaret/MystiQ/archive/v${pkgver}.tar.gz")
sha256sums=('645c6fb366ddf820d3b672bdd8b82bd71cfc6c3f838646bb9587f94b4d7849ba')

build() {
   cd ${_pkgname}-${pkgver}

   /usr/lib/qt5/bin/qmake DEFINES+=NO_NEW_VERSION_CHECK mystiq.pro
   make
}

package() {
   cd ${_pkgname}-${pkgver}

   make INSTALL_ROOT=${pkgdir} install
   install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
