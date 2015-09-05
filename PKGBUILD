# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: localizator <localizator@ukr.net>

pkgname=seafile-client
pkgver=4.3.3
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile client for synchronizing your local files with seafile server."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared>=4.3.3' 'qt4' 'qtwebkit')
makedepends=('cmake')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-client.install
source=("https://github.com/haiwen/seafile-client/archive/v${pkgver}.tar.gz")

build ()
{
	cd "$srcdir/seafile-client-${pkgver}"
	cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package ()
{
	cd "${srcdir}/seafile-client-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
sha256sums=('332348a3df60912005597f3c4cbff46608b30a0e640fdb2e01d4b88a76a940cb')
