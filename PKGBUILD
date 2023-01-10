# Maintainer: Hu3rror <hu3rror@protonmail.com>

pkgname=animationgarden-bin-dev
pkgver=2.0.0.beta04
pkgrel=1
pkgdesc="Desktop application for Animation Garden."
arch=('x86_64')
url="https://github.com/Him188/animation-garden-desktop"
license=('GPL')
depends=('expat' 'util-linux-libs' 'xdg-utils' 'zlib')
source=("https://github.com/Him188/animation-garden-desktop/releases/download/v2.0.0-beta04/AnimationGarden-2.0.0-beta04-debian-amd64.deb")
sha512sums=('9139a88e732b66808254ff4a338852b42e8a7a3e0bd134776eb7f65d0431295d8f297d1048f4d2fef12660d22796598ffaf432d19a65fd22e9c1743b2a87d3f4')
conflicts=(animationgarden-bin)
provides=(animationgarden-bin)

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

