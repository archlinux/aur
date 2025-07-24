# Maintainer: GaKu999 <gaku999 [at] posteo [dot] net>
# Credits To: Maxime Gauduin <alucryd@archlinux.org>
# vim:ft=PKGBUILD:noet:ts=3:sw=3:

pkgname=retroarch-assets-sounds
pkgver=528
pkgrel=1
epoch=1
pkgdesc='XMB menu sounds for RetroArch'
arch=(any)
url=http://www.libretro.com/
license=(CC-BY-NC-3.0)
groups=(libretro)
depends=(retroarch)
makedepends=(git)
_commit=fb39cdde6dfaea2c98218d28c71b14afc632fa03
source=(git+https://github.com/libretro/retroarch-assets.git#commit=${_commit})
sha256sums=('68d6e88510d6af203cc5cfee0c21bc13c79b921a4109462acc73606d9e3a000d')

pkgver() {
	cd retroarch-assets

	git rev-list --count HEAD
}

package() {
	cd retroarch-assets

	install -dm 755 "${pkgdir}"/usr/share/retroarch/assets
	cp -dr --no-preserve=ownership sounds "${pkgdir}"/usr/share/retroarch/assets/
}
