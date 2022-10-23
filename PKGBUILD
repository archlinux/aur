# Maintainer: Hu3rror <hu3rror@protonmail.com>

pkgname=animationgarden-bin-dev
pkgver=2.0.0
pkgrel=1
pkgdesc="Desktop application for Animation Garden."
arch=('x86_64')
url="https://github.com/Him188/animation-garden-desktop"
license=('GPL')
depends=('expat' 'util-linux-libs' 'xdg-utils' 'zlib')
source=("https://github.com/Him188/animation-garden-desktop/releases/download/v2.0.0-beta02/AnimationGarden-2.0.0-debian-amd64.deb")
sha512sums=('f3d2fd550470ee51f708e4fd10ece0c5a9e7484f013efcff505b85189a8202b5aa21f6113d15e11d1e1a0db4a6064e2bab1dabc8da82cfc67b4527113f6d5de3')
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

