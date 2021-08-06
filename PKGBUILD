# Maintainer: fsyy <fossy2001 at web dot de>
pkgname=abgate.lv2
_basename=abGate
pkgver=1.2.0
pkgrel=1
pkgdesc='abGate is LV2 noise gate plugin for Linux.'
arch=('x86_64')
license=('LGPL3')
url='https://github.com/antanasbruzas/abGate'
groups=('lv2-plugins' 'pro-audio')
depends=('gtkmm' 'lv2' 'qt5-base')
makedepends=('gcc' 'pkgconf' )
provides=("${_basename}")
conflicts=("${_basename}")
source=("https://github.com/antanasbruzas/abGate/archive/refs/tags/v1.2.0.tar.gz")
sha512sums=('18e24d21b07d86edd50df41e6679fcdf14d5124c64e6f03b829c68810a14dae6a0bde3aab4342368a29b2fefcc0ec7ec8b8f20624ee25935ed4b66b96b38b751')

build() {
	cd "${srcdir}/${_basename}-${pkgver}"
	make 
}

package() {
	cd "${srcdir}/${_basename}-${pkgver}"
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
        make DESTDIR="${pkgdir}" PREFIX=/usr install
}

