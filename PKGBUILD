# Maintainer: Martin Tuma <tumic@cbox.cz>
pkgname=qt6-pbfimageplugin
pkgver=3.0
pkgrel=1
pkgdesc='Qt image plugin for displaying Mapbox vector tiles'
arch=(x86_64)
url='https://github.com/tumic0/QtPBFImagePlugin'
license=('LGPL3')
depends=('qt6-base' 'protobuf' 'zlib')
makedepends=('qt6-tools')
provides=("${pkgname}=${pkgver}")
source=("https://github.com/tumic0/QtPBFImagePlugin/archive/${pkgver}.tar.gz")
sha256sums=('eeeabf61f60c559f536537105741dfa78dd39adbb1b266061cb3b7351b327da3')

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
