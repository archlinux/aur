# Contributor: Edvinas Valatka <edacval@gmail.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>
_pkgname=seafile-client
pkgname=${_pkgname}-qt5
pkgver=5.0.3
pkgrel=1
pkgdesc="This is seafile client for synchronizing your local files with seafile server. Qt5 version."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared>=4.3.0' 'qt5-webkit' 'qt5-base')
makedepends=('cmake' 'qt5-tools')
options=('!libtool' '!emptydirs')
conflicts=('seafile-client')
install=seafile-client-qt5.install
source=("${_pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${_pkgname}/archive/v${pkgver}.tar.gz")

build () {
    cd "$srcdir/${_pkgname}-${pkgver}"
    cmake -DUSE_QT5=ON -DBUILD_SHIBBOLETH_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package () {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
sha256sums=('0e968bec3d01fc2f17a32ac4ea89542a85b85dc88579beb9b91977f3b9cdb354')
