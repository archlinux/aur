# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.27
_pkgver="${pkgver/_/-}"
pkgrel=1
pkgdesc='Toolchain which simplifies managing Kubernetes platforms and KRM-driven infrastructure'
arch=('x86_64')
_goos='linux'
_goarch='amd64'
url='https://kpt.dev'
license=('Apache')
depends=(
	'diffutils'
	'docker'
	'git'
	'kubectl'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}-${_pkgver}"::"https://github.com/GoogleContainerTools/${_pkgname}/releases/download/v${_pkgver}/${_pkgname}_${_goos}_${_goarch}")
b2sums=('d1239b6222c16c61f7bcf31680ef778ee8a9dcb4e055a3ca153268ef02c946b7ea68a0e4b32870729adae770ab295d0d77228abb10937430313661f2a52505b9')

package() {
	install -D --mode 755 "${_pkgname}-${_pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
