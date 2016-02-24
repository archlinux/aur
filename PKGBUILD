# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Maintainer: Francesco Colista <fcolista@alpinelinux.org>

pkgname=cvechecker
pkgver=3.6
pkgrel=1
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="https://github.com/sjvermeu/cvechecker"
license=('GPL')
groups=('system')
depends=('libconfig>=1.3' 'sqlite3' 'wget' 'libxslt')
makedepends=()
provides=('cvechecker')
conflicts=('cvechecker-svn')
replaces=()
backup=()
options=()
install='cvechecker.install'
source=()
noextract=()
md5sums=('e42482fa97bc9e73534fe37b45d1b1fb')

source="https://raw.githubusercontent.com/wiki/sjvermeu/$pkgname/releases/$pkgname-$pkgver.tar.gz"


build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	./configure --prefix=/usr \
		--sysconfdir=/etc \
		--localstatedir=/var \
		--enable-sqlite3
	make
}

package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	make install DESTDIR=${pkgdir}
}

