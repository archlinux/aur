# Maintainer: Mikael Chevalier <micha1305@live.fr>
# Maintainer: Avinash Ananth Narayan R <nashpapa@gmail.com>

pkgname=cpod-bin
_pkgname=cpod
pkgver=1.27.1
pkgrel=2
pkgdesc="A simple, beautiful podcast app."
arch=("x86_64")
url="https://github.com/z-------------/cpod"
license=('APACHE')
depends=()
makedepends=()
provides=()
replaces=(cpod)
source=("https://github.com/z-------------/cpod/releases/download/v${pkgver}/${_pkgname}_${pkgver}_amd64.deb")
sha256sums=("0c07b055619fe88e33079aa663ee6ef7cee833884e4a77327b3d34893a1db69b")

prepare() {
	[ ! -d ${_pkgname}-${pkgver} ] && mkdir "${_pkgname}-${pkgver}" > /dev/null
	tar -xf data.tar.xz -C "${_pkgname}-${pkgver}"
}

package() {
	cp -r "${_pkgname}-${pkgver}"/* ${pkgdir}/
}
