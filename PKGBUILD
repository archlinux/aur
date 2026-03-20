# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7210
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

sha256sums_x86_64=('a2b95a4938e0da367a4a6d394731c6f8ec703c0950b5d898590e05bf9a83c55a')
sha256sums_aarch64=('c088d73a53bc460100d4982ad4a0cb5b2549ca3f40fa96dd88d0748fe267497b')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/crave"

}
