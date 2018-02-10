# Maintainer: Christian Rebischke <chris.rebischke@archlinux.org>

pkgname=iwd
pkgver=0.1
pkgrel=1
pkgdesc='Internet Wireless Daemon'
arch=('x86_64')
url='https://git.kernel.org/cgit/network/wireless/iwd.git/'
license=('LGPL')
depends=('glibc')
provides=('iwd')
conflicts=('iwd')
source=("https://www.kernel.org/pub/linux/network/wireless/iwd-${pkgver}.tar"{.xz,.sign})
sha512sums=('a0c0f1761edcc779509d77c9f32bf4e590976ae8806a0b34784eb2a937a758786cf839caa62e0cab853686f5940102bb2fa346f95eae502d25d912ae872c52d4'
            'SKIP')
validpgpkeys=('E932D120BC2AEC444E558F0106CA9F5D1DCF2659')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
	./configure --prefix=/usr --sysconfdir=/etc
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make install DESTDIR="${pkgdir}"
}

# vim: set ts=2 sw=2 ft=sh noet:
