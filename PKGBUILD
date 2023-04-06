# Maintainer: Brittany Figueroa <dormwear underscore iure at crowley dot seership dot dev>

pkgname=kpt-bin
_pkgname="${pkgname%-bin}"
pkgver=1.0.0_beta.30
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
b2sums=('ca8eb356802123f8b4c9c6c75b6161ccda34db2fafc1a52492e094b5cead1be62d54c9ba25d0f6bcd7a43ca26109a59ea51b0f3e9fc3d38d447d6e01e0b3f2da')

package() {
	install -D --mode 755 "${_pkgname}-${_pkgver}" "${pkgdir}/usr/bin/${_pkgname}"
}
