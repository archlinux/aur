# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.23
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
b2sums=('64b0c6fdb1ebec9756033b4ff76f492beaa5130f69f9fb6e40f369f2cae92d94c69c1787d92a2334011791d9550fed9f6cdb56e53af761ccb70987f84a02c25f')

package() {
	install -D --mode 755 "${_pkgname}-${_pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
