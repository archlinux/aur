# Maintainer: Fernandez Ludovic <lfernandez dot dev at gmail dot com>

pkgname='lego'
pkgver=v1.2.1
pkgrel=1
pkgdesc='Lets Encrypt client and ACME library written in Go'
url='https://github.com/xenolf/lego'
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
license=('MIT')
provides=("${pkgname}")
conflicts=("${pkgname}" "${pkgname}-git")

depends=()
makedepends=()

_source="${url}/releases/download/${pkgver}/${pkgname}_${pkgver}_linux"

source_x86_64=("${_source}_amd64.tar.gz")
sha256sums_x86_64=('ee8252c442e13cac40a2dcdeead9cc5812c44c393e72b39695d428b9275a0509')

source_i686=("${_source}_386.tar.gz")
sha256sums_i686=('9c521e43aa6e9eded05e54d3751028972b506614a8aae67faf9c2b50fb9f1e68')

source_armv7h=("${_source}_armv7.tar.gz")
sha256sums_armv7h=('9527c73be0b8ca1f9bddf8e0556d9c04c4e5be57a178d78f34d8536712306166')

source_aarch64=("${_source}_arm64.tar.gz")
sha256sums_aarch64=('b1b57d72a62882afcbbe18076a1c8ace2d581db4535947033d62b2b81ff50c9f')

package() {
  # Bin
	rm -f "${pkgdir}/usr/bin/${pkgname}"
	install -Dm755 "${srcdir}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

	# License
  install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
