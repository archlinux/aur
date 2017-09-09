# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Maintainer: Francesco Colista <fcolista@alpinelinux.org>

pkgname=cvechecker
pkgver=3.8
pkgrel=0
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
noextract=()
source=("https://github.com/sjvermeu/$pkgname/archive/v${pkgver}.tar.gz")
md5sums=('ebf9b4af3a1f3ac270447ec5d1168423')

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

