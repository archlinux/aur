# Maintainer: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=6.0.4.0091
pkgrel=2
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
sha256sums=('dc13718d112f77096d4036a6dac98f1ab5458d42d6aa325566d2d6bc6cc31dad')
validpgpkeys=()

prepare() {
	mkdir "$pkgname-$pkgver"
	bsdtar -xC "$pkgname-$pkgver" -f data.tar.xz
	cd "$pkgname-$pkgver"
}

package() {
	cd "$pkgname-$pkgver"
	cp -R etc "${pkgdir}/etc"
	cp -R usr "${pkgdir}/usr"
	cp -R opt "${pkgdir}/opt"
	cp -R lib "${pkgdir}/usr/lib"
	cp -R var "${pkgdir}/var"
}
