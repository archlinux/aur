# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere-bin"
pkgver=1.1
pkgrel=1
pkgdesc="A custom Scratch runtime written in C++!"
conflicts=('scratch-everywhere' 'scratch-everywhere-git')
provides=("scratch-everywhere=${pkgver})")
arch=('any')
url="https://github.com/ScratchEverywhere/ScratchEverywhere"
license=('LGPL-3.0-only')
options=(!debug)
source=(
  "https://github.com/ScratchEverywhere/ScratchEverywhere/releases/download/$pkgver/scratch-linux"
  "https://raw.githubusercontent.com/ScratchEverywhere/ScratchEverywhere/refs/tags/$pkgver/gfx/linux/scratch-everywhere.desktop"
  "https://raw.githubusercontent.com/ScratchEverywhere/ScratchEverywhere/refs/tags/$pkgver/gfx/linux/scratch-everywhere.svg"
)
sha256sums=(
  "dfeab5ac84fdd0274e162a66a183cd9dcc363696adf671ae0533f4b4ad654d5e"
  "095e6d968dc2efb833faf98dad5aa21bed6a8767e9d8a0eb9e51a32c12c7cff1"
  "b2067372a4d91529d7e9760c421e597b2aef1e051e53a5886d1afa4f071f4fd8"
)

package() {
	install -Dm755 ${srcdir}/scratch-linux $pkgdir/usr/bin/scratch-pc
	install -Dm644 ${srcdir}/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
	install -Dm644 ${srcdir}/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
