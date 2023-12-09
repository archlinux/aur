# Maintainer: Martin Tuma <tumic@cbox.cz>
pkgname=qt6-pbfimageplugin
pkgver=2.6
pkgrel=1
pkgdesc='Qt image plugin for displaying Mapbox vector tiles'
arch=(x86_64)
url='https://github.com/tumic0/QtPBFImagePlugin'
license=('LGPL3')
depends=('qt6-base' 'protobuf' 'zlib')
makedepends=('qt6-tools')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/tumic0/QtPBFImagePlugin/archive/${pkgver}.tar.gz")
sha256sums=('e759b8362b4a53dc49fff472d4adeffbd0699deb92c645a68f7bca1f1b579090')

build() {
    cd "QtPBFImagePlugin-${pkgver}"
    qmake6 pbfplugin.pro
    make
}

package() {
    cd "QtPBFImagePlugin-${pkgver}"
    make INSTALL_ROOT="${pkgdir}" install
    install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
