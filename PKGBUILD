# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=remanager-bin
pkgdesc="Open-source mod manager for reMarkable tablets"
pkgver=1.5.3
pkgrel=1
arch=('x86_64')
url="https://remanager.io/"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1')

source=(
	"remanager-linux-${pkgver}.tgz::https://github.com/rmitchellscott/reManager/releases/download/v${pkgver}/reManager-linux-amd64.tar.gz"
	"reManager.svg::https://raw.githubusercontent.com/rmitchellscott/reManager/refs/tags/v${pkgver}/assets/icon.svg"
	"reManager.desktop"
)
sha256sums=(
	'4d82a8de93f612e2dbd9139dfa5ff340fb9a93fba525ddd0e400d71fcc1ad2ab'
	'ae00ec88e4ad4284755aeef6fbdc6c9af5abe32625bf1512e51ba56a0bed40ec'
	'SKIP'
)

package() {
	install -Dm0644 reManager.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm0644 reManager.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
	install -Dm0755 reManager -t "${pkgdir}"/usr/bin/
}
