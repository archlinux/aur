# Maintainer: Moritz Maxeiner <moritz@ucworks.org>

# Contributor: localizator <localizator@ukr.net>

pkgname=seafile-client
pkgver=4.2.4
pkgrel=1
pkgdesc="Seafile is an online file storage and collaboration tool. This is seafile client for synchronizing your local files with seafile server."
arch=('i686' 'x86_64')
url="https://github.com/haiwen/seafile-client/"
license=('Apache')
depends=('seafile-shared>=4.2.4' 'qt5-base' 'qt5-webkit' 'qt5-tools')
makedepends=('cmake')
optdepends=()
options=('!libtool' '!emptydirs')
install=seafile-client.install
source=("https://github.com/haiwen/seafile-client/archive/v${pkgver}.tar.gz")

build ()
{
	cd "$srcdir/seafile-client-${pkgver}"
	cmake -DUSE_QT5=on -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr .
	make
}

package ()
{
	cd "${srcdir}/seafile-client-${pkgver}"
	make DESTDIR="${pkgdir}/" install
}
sha256sums=('49b8c7b2161a8a8fadbc2e2e36a80642d67ba8fd11b975a3f5f391d76de4c9af')
