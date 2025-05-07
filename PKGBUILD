# Maintainer: realroot <user3mila@disroot.org>

pkgname=wotimer
pkgver=0.3.0
pkgrel=1
pkgdesc="Qml (from Qt) timer with WorkOuts in mind."
arch=('x86_64' 'aarch64')
url="https://codeberg.org/realroot/wotimer"
license=('AGPL3')
makedepends=('qt6-base' 'make' 'git' 'gcc')
depends=('qt6-base' 'qt6-multimedia' 'qt6-declarative' 'qt6-webengine')
conflicts=('wotimer-git')
#optdepends=('')
source=("$pkgname-$pkgver.tar.gz::https://codeberg.org/realroot/wotimer/archive/$pkgver.tar.gz")
sha512sums=('328fe4059a7dd663a933907b061056cbee80e1b37cbddc9359263597b5ac66f0f3ea3609bdb99c1170df7d5b7f9355c6364c542a9598b3cd7ad721b41586b8e3')

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
