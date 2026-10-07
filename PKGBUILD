# Maintainer: Monsoon <29970829+monsoon235@users.noreply.github.com>
pkgname=kvmfr-dkms
pkgver=B7
pkgrel=2
pkgdesc='DKMS package for the Looking Glass KVMFR kernel module'
arch=('any')
url='https://github.com/gnif/LookingGlass'
license=('GPL-2.0-or-later')
depends=('dkms')
provides=('kvmfr' 'looking-glass-module-dkms')
conflicts=('looking-glass-module-dkms' 'looking-glass-module-dkms-git' 'looking-glass-rc-module-dkms')
_modulever=0.0.12
source=("looking-glass-${pkgver}.tar.gz::https://looking-glass.io/artifact/${pkgver}/source")
sha512sums=('a3f0193451c64dbd9ead01538fa53cc78b42d318d54b2eef026fb730811e055bb140b67dcd91c1da5ef09ec74fbb141c791b53264a56a943308b81a6e49e1e93')

package() {
	local srcdir_pkg="${pkgdir}/usr/src/kvmfr-${_modulever}"
	install -dm755 "${srcdir_pkg}"
	install -m644 "${srcdir}/looking-glass-${pkgver}/module/"{Makefile,dkms.conf,kvmfr.c,kvmfr.h,test.c,test.expected} "${srcdir_pkg}/"
}
