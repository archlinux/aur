# Maintainer: eNV25 <env252525@gmail.com>

pkgname=gcc-go-no-conflicts
_pkgname_=gcc-go
pkgver=11.1.0
pkgrel=3
_pkgrel_=1
pkgdesc='Go front-end for GCC, does not conflict with go package.'
arch=(x86_64)
url='https://gcc.gnu.org'
license=(GPL LGPL FDL custom)
depends=("gcc=$pkgver-${_pkgrel_}")
provides=(gcc-go "go=1.12.2" ${_pkgname_}-multilib)
replaces=(gcc-go ${_pkgname_}-multilib)
conflicts=(gcc-go)
options=(!strip)

source_x86_64=("${_pkgname_}-${pkgver}-${_pkgrel_}-x86_64.tar.zst::https://archlinux.org/packages/core/x86_64/${_pkgname_}/download/")
sha256sums_x86_64=('8bc1dc82ca3220bec383a2a4bdf6fe1cb9a34a3cb2c9e01700ce5709da754343')

package() {
	install -Dm755 "${srcdir}/usr/bin/go" "${pkgdir}/usr/bin/gcc-go"
	install -Dm755 "${srcdir}/usr/bin/gofmt" "${pkgdir}/usr/bin/gcc-gofmt"
	install -Dm755 "${srcdir}/usr/bin/gccgo" "${pkgdir}/usr/bin/gccgo"
	install -Dm755 "${srcdir}/usr/bin/x86_64-pc-linux-gnu-gccgo" "${pkgdir}/usr/bin/x86_64-pc-linux-gnu-gccgo"

	cp -prd "${srcdir}/usr/lib/" "${pkgdir}/usr/"
	cp -prd "${srcdir}/usr/lib32/" "${pkgdir}/usr/"
	cp -prd "${srcdir}/usr/share/" "${pkgdir}/usr/"
}
