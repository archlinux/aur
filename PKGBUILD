# Maintainer: Mikuro Kagamine <mikurok@forgecrushing.com>

_gonamespc='github.com/schollz/croc'
pkgname=croc-bin
pkgver=4.1.5
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
sha256sums=('f407124497af8ff2b6c438092bced3d6d905006fd3e64d7c695206b10b874796')

build() {
	if [ $(which upx 2>/dev/null) ]; then
		echo Compressing ${provides[0]} with UPX...
		upx --best "${srcdir}/${provides[0]}"; fi
}

package() {
	install -Dm755 "${srcdir}/${provides[0]}" "${pkgdir}/usr/bin/${provides[0]}"
}
