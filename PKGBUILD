# Maintainer: Hugo Berthet-Rambaud <hugoberthetrambaud@outlook.com>
pkgname=memorize
pkgver=0.2.4
pkgrel=1
pkgdesc="Study flashcards in a native GNOME app "
arch=('x86_64')
url="https://github.com/david-swift/Memorize"
license=('GPL-3.0')
groups=()
depends=(gtk4)
makedepends=(swift-language)
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/david-swift/Memorize/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('15f920ab8f38c3ddf9bc0e5ebf3c9cd23eef23dea1d0b9a6ca1e7acefc383ae3')

build() {
	cd "Memorize-$pkgver"

	swift build -c release --static-swift-stdlib
}

package() {
	cd "Memorize-$pkgver"
    install -Dm755 .build/release/Flashcards $pkgdir/usr/bin/Flashcards
    install -Dm644 data/io.github.david_swift.Flashcards.desktop $pkgdir/usr/share/applications/io.github.david_swift.Flashcards.desktop
    install -Dm644 data/icons/io.github.david_swift.Flashcards.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/io.github.david_swift.Flashcards.svg
    install -Dm644 data/icons/io.github.david_swift.Flashcards-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards-symbolic.svg
    install -Dm644 data/icons/set-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.set-symbolic.svg
    install -Dm644 data/icons/settings-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.settings-symbolic.svg
    install -Dm644 data/icons/mistake-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.mistake-symbolic.svg
    install -Dm644 data/icons/tag-outline-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.tag-outline-symbolic.svg
    install -Dm644 data/icons/share-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.share-symbolic.svg
    install -Dm644 data/icons/import-symbolic.svg $pkgdir/usr/share/icons/hicolor/symbolic/apps/io.github.david_swift.Flashcards.import-symbolic.svg
}

