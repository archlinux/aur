# Maintainer: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=6.0.5.0106
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
sha256sums=('a746cff347992813a7448ac578039ab8e86501123664e22565a38f1a91e3fa29')
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
