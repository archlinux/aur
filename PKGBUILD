# Maintainer: Hu3rror <hu3rror@protonmail.com>

pkgname=animationgarden-bin
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop application for Animation Garden."
arch=('x86_64')
url="https://github.com/Him188/animation-garden"
license=('GPL')
depends=('expat' 'util-linux-libs' 'xdg-utils' 'zlib')
source=("https://github.com/Him188/animation-garden/releases/download/v2.0.0/AnimationGarden-2.0.0-debian-amd64.deb")
sha512sums=('7562a5bc477a988c5bdf74dfc4c1c767814f8e6ed35faf7a39b15842923e7a48a4548ade5379ec73aa8d9cdf1880ca09ec17201379f945920872a04176958853')
provides=(animationgarden-bin)
conflicts=(animationgarden-bin-dev)

package(){
	cd "${srcdir}"
	# Extract package dataj
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/animationgarden/bin/AnimationGarden "${pkgdir}"/usr/bin/AnimationGarden
	install -Dm644 "${pkgdir}"/opt/animationgarden/share/doc/copyright "${pkgdir}"/usr/share/licenses/$pkgname/COPYRIGHT
 	sed -i 's|^Exec=/opt/animationgarden/bin/AnimationGarden|Exec=AnimationGarden|g' "${pkgdir}"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
 	sed -i 's|^Icon=/opt/animationgarden/lib/AnimationGarden|Icon=/usr/share/icons/AnimationGarden|g' "${pkgdir}"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop" "${pkgdir}/usr/share/applications/animationgarden-AnimationGarden.desktop"
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/AnimationGarden.png" "${pkgdir}/usr/share/icons/AnimationGarden.png"
}
