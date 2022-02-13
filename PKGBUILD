# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='anastasis'
pkgver='0.2.0'
pkgrel=1
pkgdesc='Protocol and implementation to securely deposit core secrets and recover them if their original copies are lost'
arch=('i686' 'x86_64')
url="https://www.gnu.org/software/${pkgname}"
license=('AGPL')
depends=('jansson' 'gnunet' 'libgcrypt' 'postgresql' 'taler-exchange'
         'taler-merchant')
conflicts=("${pkgname}-git" "${pkgname}-bin")
source=("ftp://ftp.gnu.org/gnu/${pkgname}/${pkgname}-${pkgver}.tar.gz")
sha512sums=('116508ba90ca8164ed5569f7ee752fae7361778c3330b2e6869692b1997117c9999fdd2f62a39cbad156b24473737413dfed182d9559d4c284f2de7087962bff')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}

