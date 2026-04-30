# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7218
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

sha256sums_x86_64=('5cb337aebffaa223d9166e5aa22db94d13e669a9ebe8421c5ac9b3d5ee28d1f3')
sha256sums_aarch64=('a4572b6dca4754ec2c412449fd3119baf038e9dfc9fbf1eb8fe5cdaa3a7f9259')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/crave"

}
