# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc-bin
pkgver=6.0.7
pkgrel=1
pkgdesc="Easily and securely send things from one computer to another."
arch=('x86_64')
url="https://${_gonamespc}"
license=('MIT')
#depends=()
#makedepends=('go')
optdepends=('upx: compress binary')
provides=('croc')
conflicts=('croc' 'croc-git')
#options=()
source=("${url}/releases/download/v${pkgver}/${provides[0]}_${pkgver}_linux-64bit.tar.gz")
sha256sums=('196c60603e6abc59d02e22ddf877e2eb880500174fa1cfec0e7bbcb43afac7fd')

build() {
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		upx "${srcdir}/${provides[0]}"; fi
}

package() {
	install -Dm755 "${srcdir}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
}
