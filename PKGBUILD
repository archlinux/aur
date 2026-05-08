# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7220
pkgver="${_pkgver/-/.}"
pkgrel=2
pkgdesc="Crave CLI - Binary Version"
arch=('x86_64' 'aarch64')
url="https://github.com/accupara/crave"
license=('Proprietary')
depends=( 'glibc' 'libxcrypt-compat' 'openssh' 'rsync' 'zlib' )
provides=('crave' 'crave-bin')
conflicts=('crave-bin')

source_x86_64=( crave-${_pkgver}-x86_64::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-amd64.bin )
source_aarch64=( crave-${_pkgver}-aarch64::https://github.com/accupara/crave/releases/download/${_pkgver}/crave-${_pkgver}-linux-aarch64.bin )

sha256sums_x86_64=('cb25642f1daa257f9834cccfd9d3282c65ae6dd34cd0dfc41cd0f824c8b3456b')
sha256sums_aarch64=('ef60f9138a9840534fda840e852e260919fff0d9ab4fde2a0909d7ff170e2207')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/crave"

}
