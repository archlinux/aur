# Contributor: localizator <localizator@ukr.net>
# Maintainer: Edvinas Valatka <edacval@gmail.com>

pkgname=seafile-client
pkgver=4.4.2
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
	cmake -DBUILD_SHIBBOLETH_SUPPORT=ON -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package ()
{
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
sha256sums=('86fbdfd2ac4de113aa4498802fbc663bc150ec4525f2ccf6b87d45af624f432a')
