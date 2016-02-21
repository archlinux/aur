# Contributor: localizator <localizator@ukr.net>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=5.0.5
pkgrel=1
pkgdesc="This is seafile client for synchronizing your local files with seafile server. Qt4 version."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared' 'qt4>=4.8.0' 'qtwebkit')
makedepends=("cmake" "seafile-shared>=${pkgver}" )
options=('!libtool' '!emptydirs')
conflicts=('seafile-client-qt5')
install=seafile-client.install
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${pkgname}/archive/v${pkgver}.tar.gz")

build () {
    cd "$srcdir/${pkgname}-${pkgver}"
    cmake -DBUILD_SHIBBOLETH_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
    make
}

package () {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}
sha256sums=('c3f254219c00abbdcc84cd97a83bab44f1ea4ad38ca5b600c7539678ab7cd447')
