# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Yamashiro <dev cosmicheron com>

pkgname='yamagi-quake2-ref_vk'
pkgver='1.0.12'
pkgrel='1'
arch=('i686' 'x86_64')
pkgdesc='Vulkan renderer for yamagi-quake2'
url='https://github.com/yquake2/ref_vk/'
license=('GPL-2.0-only' 'MIT' 'Unlicense')
depends=('glibc' 'yamagi-quake2' 'sdl3')
makedepends=('vulkan-headers')
optdepends=('vulkan-validation-layers')
source=("${pkgname##*-}-${pkgver}.tar.gz::https://github.com/yquake2/${pkgname##*-}/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('307c48878d55bc36acda754bae4574ef0b42a3df8ff44576f01950fd785a592104fbb18bb972ce82f93516801af4879a55b1418fe456251ba1759142d056a605')

build() {
	make -C "${pkgname##*-}-${pkgver}"
}

package() {
	cd "${pkgname##*-}-${pkgver}"

	# library
	install -Dm644 'release/ref_vk.so' "${pkgdir}/usr/lib/yamagi-quake2/ref_vk.so"

	# doc
	install -Dm644 'README.md' "${pkgdir}/usr/share/doc/${pkgname}/README.md"

	# license
	install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
