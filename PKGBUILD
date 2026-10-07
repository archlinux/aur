# Maintainer: Grady Link <aur@grady.link>
pkgname="scratch-everywhere-bin"
pkgver=1.2
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
  "8b5667adf66924ca46d8664dd9d442e9431e3c9da8d9edb491ad140ad264b736"
  "d2021afc4e2c5fc2445cfa3ee4a0c4f4ed2068f633b231d99b41e7fe1cb5a771"
  "b2067372a4d91529d7e9760c421e597b2aef1e051e53a5886d1afa4f071f4fd8"
)
depends=(libpulse)

package() {
	install -Dm755 ${srcdir}/scratch-linux $pkgdir/usr/bin/scratch-pc
	install -Dm644 ${srcdir}/scratch-everywhere.desktop $pkgdir/usr/share/applications/scratch-everywhere.desktop
	install -Dm644 ${srcdir}/scratch-everywhere.svg $pkgdir/usr/share/icons/hicolor/scalable/apps/scratch-everywhere.svg
}
