# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=supertux-advance
pkgver=0.2.0
pkgrel=1
pkgdesc="a fan game of SuperTux written in Squirrel using Brux GDK. The name comes from the graphical style, which uses a lower resolution display and a sprite style similar to Sonic Advance."
arch=('any')
url="https://github.com/KelvinShadewing/supertux-advance"
license=('GPL')
depends=(physfs sdl2_gfx sdl2_image sdl2_net sdl2_mixer)
install=$pkgname.install
source=("${pkgname}" "${pkgname}-${pkgver}.zip::https://github.com/KelvinShadewing/supertux-advance/releases/download/v0.2.0/sta-0.2.0.zip")
sha256sums=('e8636bd49b8388350f20a1e9f3bbb007ee612f5c9c59a1413cb10b960dac8e5c'
            '781cf8012fa4b79bdbd135b9d6b9244a287dcbcabcef2e6c451e8f00520aba72')


package() {
#	cd "$pkgname-$pkgver"
	#install -Dm 744 * -t "${pkgdir}/opt/$pkgname"
	install -Dm 755 "$pkgname" "${pkgdir}/usr/bin/$pkgname"
	mkdir -p "${pkgdir}/opt/$pkgname/"
	cp -r * "${pkgdir}/opt/$pkgname"
	chmod 755 -R "${pkgdir}/opt/$pkgname"
}
