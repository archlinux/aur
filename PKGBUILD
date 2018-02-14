# Maintainer: Avinash Ananth Narayan R <nashpapa@gmail.com>
pkgname=cpod
pkgver=1.14.0
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
sha256sums=("fdedfe3ca407db25661386807eb55cc6d426b9bb3cdf7b441015738cbabc79fb")

prepare() {
	[ ! -d ${pkgname}-${pkgver} ] && mkdir "${pkgname}-${pkgver}" > /dev/null
	tar -xf data.tar.xz -C "${pkgname}-${pkgver}"
}

package() {
	cp -r "${pkgname}-${pkgver}"/* ${pkgdir}/
}
