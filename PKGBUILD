# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7226
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

sha256sums_x86_64=('a492f00f7c7659a20d21379b1e3b72b6ab855f361c6848c9b0571e8131583eda')
sha256sums_aarch64=('be814fbf0f672bc0aad7acdfe4646759b510433bf52e94c5925b30f068342f4e')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/crave"

}
