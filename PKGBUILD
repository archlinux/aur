# Maintainer: Mikael Chevalier <micha1305@live.fr>
pkgname=cpod
pkgver=1.27.1
pkgrel=1
pkgdesc="A simple, beautiful podcast app."
arch=("x86_64")
url="https://github.com/z-------------/cumulonimbus"
license=('APACHE')
depends=()
makedepends=()
provides=()
replaces=(cumulonimbus)
source=("https://github.com/z-------------/cumulonimbus/releases/download/v${pkgver}/${pkgname}_${pkgver}_amd64.deb")
sha256sums=("0c07b055619fe88e33079aa663ee6ef7cee833884e4a77327b3d34893a1db69b")

prepare() {
	[ ! -d ${pkgname}-${pkgver} ] && mkdir "${pkgname}-${pkgver}" > /dev/null
	tar -xf data.tar.xz -C "${pkgname}-${pkgver}"
}

package() {
	cp -r "${pkgname}-${pkgver}"/* ${pkgdir}/
}
