_pkgname="magicard_ltd-linux_driver"
pkgname="magicard-ltd-linux-driver"
pkgdesc="Printer Driver for Magicard Series"
pkgver=1.2.3
pkgrel=1
arch=('x86_64')
url="https://support.magicard.com/solution/linux-driver/"
license=('EULA')
depends=('libcurl-gnutls' 'glibc')
source=('https://f08ddbe93aa02eaf9a6c-f08cd513e3a8c914f4f8f62af1786149.ssl.cf3.rackcdn.com/magicard_ltd-linux_driver-1.2.3.tar.gz')
md5sums=('dc9fcdbed3e4ba6fa990c97f9ab022b6')

build() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make
}

package() {
  cd ${srcdir}/${_pkgname}-${pkgver}
  make DESTDIR="$pkgdir/" install
}
