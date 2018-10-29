# Maintainer: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=6.0.3.0073
pkgrel=1
epoch=
pkgdesc="FortiClient"
arch=("x86_64")
url=""
license=('custom')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=(forticlient)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://repo.fortinet.com/repo/ubuntu/pool/multiverse/${pkgname}/${pkgname}_${pkgver}_amd64.deb")
noextract=()
sha256sums=('f552adb6f7b2c1b3dd01e6b843ccf3fca876d69ad86cf793d08ed8714a8ecdcb')
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	bsdtar -xC "$pkgname-$pkgver" -f data.tar.gz
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	cp -R etc "${pkgdir}/etc"
	cp -R usr "${pkgdir}/usr"
	cp -R lib "${pkgdir}/usr/lib"
	cp -R var "${pkgdir}/var"
}
