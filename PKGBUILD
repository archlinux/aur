# Maintainer: Savely Krasovsky <savely@krasovs.ky>
pkgname=vkteams-scb-bin
pkgver=2.9.2
pkgrel=2
pkgdesc="VK Teams (Sovcombank PJSC)"
arch=("x86_64")
url="https://dl.vk.halva.com/"
license=('unknown')
replaces=('vkteams-bin')
source=("https://dl.vk.halva.com/downloads/linux/x64/latest/vkteams.tar.xz"
	"vkteams.desktop"
	"256x256.png")

package() {
	install -dm755 "${pkgdir}/opt/"
	cp -dpr --no-preserve=ownership "." "${pkgdir}/opt/vkteams"
	install -dm755 "${pkgdir}/usr/bin"
	ln -s "/opt/vkteams/vkteams" "${pkgdir}/usr/bin/vkteams"

	# Desktop file
	install -D -m644 "vkteams.desktop" \
		"${pkgdir}/usr/share/applications/vkteams.desktop"

	# Icon
	install -d -m755 "${pkgdir}/usr/share/icons/hicolor/256x256/apps"
	cp -dpr --no-preserve=ownership "256x256.png" \
		"${pkgdir}/usr/share/icons/hicolor/256x256/apps/vkteams.png"
}

sha256sums=('3ad6c0569b193c37439a393900448bba5882589ac2f6be383a6482671682c8fa'
            'd3ef10089177c8bab4e8d8ee36b2c0cf6bde125bfacaf710361280e9c3c2110f'
            '4f3092d5a6b1787dd30fe844404572df2ec75e6a4278ad534bf67281f66c3240')
