# Contributor: localizator <localizator@ukr.net>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=5.0.0
pkgrel=2
pkgdesc="This is seafile client for synchronizing your local files with seafile server. Qt4 version."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared>=4.3.0' 'qt4>=4.8.0' 'qtwebkit')
makedepends=('cmake')
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
sha256sums=('38a64c8bd0a32765ebccd4b32e9a12abd754b55a64bc18d32ddf75bbac142994')
