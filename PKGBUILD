# Maintainer: Ethan Nishimura <gnarlsnishi [at] gmail [dot] com>
# Maintainer: Leon Plickat <leonhenrik.plickat [at] stud.uni-goettingen [dot] de>

pkgname='wlclock'
pkgver=1.0.1
pkgrel=2
pkgdesc="A digital analog clock for Wayland desktops"
arch=('x86_64')
url="https://git.sr.ht/~leon_plickat/wlclock"
license=('GPL3')
depends=('wayland' 'wayland-protocols' 'cairo')
makedepends=('gcc' 'git' 'meson' 'ninja' 'scdoc')
provides=('wlclock')
conflicts=('wlclock-git')
source=("${pkgname}-v${pkgver}.tar.gz::https://git.sr.ht/~leon_plickat/wlclock/archive/v${pkgver}.tar.gz")
sha256sums=('df624174a07dc381773039c230252e3364abee81831069ce66a12970311accfa')

build() {
	arch-meson --prefix=/usr "$pkgname-v$pkgver" build
	ninja -C build
}

package() {
	DESTDIR=${pkgdir} ninja -C build install
}
