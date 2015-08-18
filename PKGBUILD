# Contributor: localizator <localizator@ukr.net>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=4.3.4
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile client for synchronizing your local files with seafile server."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared>=4.4.2' 'qt4' 'qtwebkit')
makedepends=('cmake')
options=('!libtool' '!emptydirs')
install=seafile-client.install
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/haiwen/${pkgname}/archive/v${pkgver}.tar.gz")

build ()
{
	cd "$srcdir/${pkgname}-${pkgver}"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package ()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
md5sums=('137a474aca893cec66e5f1e87dc2d0d1')
