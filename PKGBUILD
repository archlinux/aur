# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname=retroarch-assets-sounds
pkgver=532
pkgrel=1
epoch=1
pkgdesc='XMB menu sounds for RetroArch'
arch=(any)
url=http://www.libretro.com/
license=(CC-BY-NC-3.0)
groups=(libretro)
depends=()
makedepends=(git)
_commit=2d24ef2972a709f870cc3f73853158fa2376f37d
source=(git+https://github.com/libretro/retroarch-assets.git#commit=${_commit})
sha256sums=('5b45e41d12ac657519ac1706f9b467f4f90f9881d5fa1f604e2e4987417e11e7')

pkgver() {
	cd retroarch-assets

	git rev-list --count HEAD
}

package() {
	cd retroarch-assets

	install -dm 755 "${pkgdir}"/usr/share/retroarch/assets
	cp -dr --no-preserve=ownership sounds "${pkgdir}"/usr/share/retroarch/assets/
}
