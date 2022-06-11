# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.17
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
b2sums=('dab04d58885327d6724f10d1e416bfcca1d9931a37d91cc8f71e22ca9a16393c20bab70f0d829770f3245e4fa3d34669e3913c61ed47f9952c1c24a58191619d')

package() {
	install -D --mode 755 "${_pkgname}-${_pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
