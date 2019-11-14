# Maintainer: Sharky <sharky@sharky.pw>
pkgname=azirevpn-git
pkgver=28
pkgrel=1
pkgdesc="AzireVPN Qt GUI client"
arch=('x86_64' 'i686')
url="https://www.azirevpn.com/client"
license=('GPL2')
depends=(openvpn)
makedepends=(qt5-tools qt5-base)
source=("git+https://github.com/azirevpn/azclient.git")
md5sums=("SKIP")

pkgver() {
  cd ${srcdir}/azclient
  git rev-list --count HEAD
}

prepare() {
    cd "azclient"
    qmake
}


build() {
	cd "azclient"
	make
}


package() {
	cd "azclient"
	make DESTDIR="$pkgdir/" install
}
