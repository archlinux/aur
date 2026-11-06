# Maintainer: Kitty Dae Elliott <kdelliott@pm.me>
pkgname=remanager-bin
pkgdesc="Open-source mod manager for reMarkable tablets"
pkgver=2.0.0
pkgrel=1
arch=('x86_64')
url="https://remanager.io/"
license=('GPL3')
depends=('gtk3' 'webkitgtk-6.0')

source=(
	"remanager-linux-${pkgver}.tgz::https://github.com/rmitchellscott/reManager/releases/download/v${pkgver}/reManager-linux-amd64.tar.gz"
	"reManager.svg::https://raw.githubusercontent.com/rmitchellscott/reManager/refs/tags/v${pkgver}/assets/icon.svg"
	"reManager.desktop"
)
sha256sums=('f086bac6384a86fca0cbab0e7eb5c4be45683ab32e73a7e83645af2dc8849fac'
            'ae00ec88e4ad4284755aeef6fbdc6c9af5abe32625bf1512e51ba56a0bed40ec'
            'af71e3ee3c5c2f59f045a96ac4a8d4b609a2a66ed02ee05458a07536d022c94d')

package() {
	install -Dm0644 reManager.desktop -t "${pkgdir}"/usr/share/applications/
	install -Dm0644 reManager.svg -t "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/
	install -Dm0755 reManager -t "${pkgdir}"/usr/bin/
}
