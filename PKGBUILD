# Maintainer: realroot <user3mila@disroot.org>

pkgname=wotimer
pkgver=0.2.0
pkgrel=1
pkgdesc="Qml (from Qt) timer with WorkOuts in mind."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/realroot/wotimer"
license=('AGPL3')
makedepends=('qt6-base' 'make' 'git' 'gcc')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative')
conflicts=('wotimer-git')
#optdepends=('')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/realroot/wotimer/archive/$pkgver.tar.gz")
sha512sums=('41815907ce94ed135c83f40c235dad35300670aaea73c33a5967e7c9da1e6b198f7c8026c5131b1f5c8b20bb755dbedb2c1c2b1525a95e0fc666e146e371066f')

build() {
	cd "$pkgname"
	qmake6
	make 
}

package() {
	cd "$pkgname"
	install -Dm644 src/com.root.WoTimer.svg "$pkgdir"/usr/share/icons/hicolor/scalable/apps/com.root.WoTimer.svg
	install -Dm644 src/com.root.WoTimer.desktop "$pkgdir"/usr/share/applications/com.root.WoTimer.desktop
	install -Dm755 wotimer "$pkgdir"/usr/bin/wotimer
}
