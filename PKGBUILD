# Contributor: Edvinas Valatka <edacval@gmail.com>
# Maintainer: Edvinas Valatka <edacval@gmail.com>
_pkgname=seafile-client
pkgname=${_pkgname}-qt5
pkgver=5.0.5
pkgrel=1
pkgdesc="This is seafile client for synchronizing your local files with seafile server. Qt5 version."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared' 'qt5-webkit' 'qt5-base')
makedepends=('cmake' 'qt5-tools' "seafile-shared>=${pkgver}")
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
sha256sums=('c3f254219c00abbdcc84cd97a83bab44f1ea4ad38ca5b600c7539678ab7cd447')
