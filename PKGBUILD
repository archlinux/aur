# Maintainer: Omansh Krishn <omansh@duck.com>

pkgname=crave
_pkgver=0.2-7208
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

sha256sums_x86_64=('80c41b0efc5152961e3b4cac04fcf51458ebd751224d3d7f605f62b0d5475e6d')
sha256sums_aarch64=('49eeaf174b1bf17cece8e7b1059e3aa9332599f24047565228bfbd5bccbdbd9e')

package() {

	install -dm755 "${pkgdir}/usr/bin"
	install -Dm755 "${srcdir}/crave-${_pkgver}-${CARCH}" "${pkgdir}/usr/bin/crave"

}
