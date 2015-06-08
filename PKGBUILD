# Contributor: Francesco Colista <francesco.colista@gmail.com>
# Maintainer: Francesco Colista <francesco.colista@gmail.com>

pkgname=cvechecker
pkgver=3.5
pkgrel=0
pkgdesc="a local CVE checker tool"
arch=('i686' 'x86_64')
url="http://cvechecker.sourceforge.net/"
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
md5sums=('d8aa4dcdf11ad9c19521fbb96132074e')
source="http://sourceforge.net/projects/cvechecker/files/$pkgname-$pkgver.tar.gz"

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

