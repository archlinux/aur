# Maintainer: Hu3rror <hu3rror@protonmail.com>

pkgname=animationgarden-bin
pkgver=1.2.0
pkgrel=3
pkgdesc="Desktop application for Animation Garden."
arch=('x86_64')
url="https://github.com/Him188/animation-garden-desktop"
license=('GPL')
depends=('expat' 'util-linux-libs' 'xdg-utils' 'zlib')
source=("https://github.com/Him188/animation-garden-desktop/releases/download/v1.2.0/AnimationGarden-1.2.0-debian-amd64.deb")
sha512sums=('caa045b570ca143d1b5e1c28293f6c18464e7e84353d2f814d361478588c93535f6a7ff267b01b5572e79cac5f0251bf0f26d65f62abd4ef0456f228bb120d1a')

package(){
	cd "${srcdir}"
	# Extract package dataj
	tar -xJ -f data.tar.xz -C "${pkgdir}"
	install -dm755 "${pkgdir}"/usr/bin
	ln -s /opt/animationgarden/bin/AnimationGarden "${pkgdir}"/usr/bin/AnimationGarden
	install -Dm644 "${pkgdir}"/opt/animationgarden/share/doc/copyright "$pkgdir"/usr/share/licenses/$pkgname/COPYRIGHT
 	sed -i 's|^Exec=/opt/animationgarden/bin/AnimationGarden|Exec=AnimationGarden|g' "$pkgdir"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
 	sed -i 's|^Icon=/opt/animationgarden/lib/AnimationGarden|Icon=/usr/share/icons/AnimationGarden|g' "$pkgdir"/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/animationgarden-AnimationGarden.desktop" "${pkgdir}/usr/share/applications/animationgarden-AnimationGarden.desktop"
	install -Dm644 "${pkgdir}/opt/animationgarden/lib/AnimationGarden.png" "${pkgdir}/usr/share/icons/AnimationGarden.png"
}
