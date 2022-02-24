# Maintainer: <cradcore at zoho dot com>

_pkgname=proxybound
pkgname=$_pkgname-git
pkgver=5.60.r1.g678b607
pkgrel=1
pkgdesc="Linux applications proxifier"
arch=('x86_64')
url="https://github.com/cradcore/Proxybound"
license=('GPL')
provides=('proxybound')
replaces=('proxybound')
conflicts=('proxybound')
depends=('glibc')
backup=('etc/proxybound.conf')
source=("git+https://github.com/cradcore/$_pkgname.git")
sha512sums=('SKIP')

pkgver() {
  cd $_pkgname
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
  cd $_pkgname
  ./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install-config
}

# vim:set ts=2 sw=2 et:

 
