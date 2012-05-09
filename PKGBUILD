# Maintainer: BlackIkeEagle <ike DOT devolder AT gmail DOT com>

pkgname=kvirtual
pkgver=1.1.0
_commithash='333d832'
_developer='didier13150'
pkgrel=1
pkgdesc="KDE4 GUI-frontend for kvm/qemu emulator"
arch=('i686' 'x86_64')
url="http://kde-apps.org/content/show.php/KVirtual?content=150682"
license=('GPL2')
depends=('kdebase-runtime' 'qemu')
makedepends=('cmake' 'automoc4')
source=("$pkgname-$pkgver.tar.gz::https://github.com/$_developer/$pkgname/tarball/$_commithash")

_srcfolder=$_developer-$pkgname-$_commithash

build() {
	mv "$_srcfolder" "$pkgname-$pkgver"

	cd "$pkgname-$pkgver"
	mkdir -p build
	cd build
	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=RelWithDebInfo ..
	make
}
package() {
	cd "$pkgname-$pkgver/build"
	make DESTDIR="$pkgdir" install
}
sha256sums=('45d995d62810c7d10793b1b38b2bb3e23d8cbc6a26c3e63ba9264b7b76ee2fa9')
