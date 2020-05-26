# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=qt5-styleplugins
pkgver=5.0.0.20170311
_commit=335dbece103e2cbf6c7cf819ab6672c2956b17b3
pkgdesc='Additional style plugins for Qt5'
pkgrel=20
arch=('x86_64')
url="https://github.com/qt/qtstyleplugins"
license=('LGPL')
depends=('qt5-base' 'gtk2')
source=("${pkgname}-${_commit}.tar.gz::${url}/archive/${_commit}.tar.gz")
sha512sums=('e8c2d0e9c6b0a47cab04ffd2e9384606638905b63a7c1580f9b629bbcc84ebff19743363ffee3dbd31c3de1dcda684211ad3052932b5aa0081e529afd9cbb14d')

build() {
    cd qtstyleplugins-${_commit}

    qmake PREFIX='/usr' \
        CONFIG+='nostrip' \
        QMAKE_CFLAGS_RELEASE="$CFLAGS" \
        QMAKE_CXXFLAGS_RELEASE="$CXXFLAGS"
    make
}

package() {
    cd qtstyleplugins-${_commit}

    make INSTALL_ROOT="${pkgdir}" install
}
