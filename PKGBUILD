# Maintainer: Harms <thotro at lyse dot net>
pkgname=forticlient
pkgver=6.0.8.0140
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
sha256sums=('d6667104f4c2766dfa0b62336ed9ca201bcc098cc612d6ac457628106e183b75')
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
