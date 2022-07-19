# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.18
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
b2sums=('1427847d7f78a127aa9859631b3ff460295f2c261472fad698192d45fdf0d628254f1fe8bb32791bac6a1d32cd5a2e3bd2762411be69754856811f9335270d98')

package() {
	install -D --mode 755 "${_pkgname}-${_pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
