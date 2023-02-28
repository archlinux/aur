# Maintainer: water_lift <0xWATERx0@gmail.com>
pkgname=defold
pkgver=1.4.3
pkgrel=1
epoch=
pkgdesc="Defold is a completely free to use game engine for development of desktop, mobile and web games."
arch=(x86_64)
url="https://defold.com/"
license=("custom")
groups=()
depends=("glu")
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("http://d.defold.com/archive/editor-alpha/8eaab6b1281ce492163428e0e7b2e0fa247a0a93/editor-alpha/editor2/Defold-x86_64-linux.zip"
	"http://d.defold.com/archive/stable/8eaab6b1281ce492163428e0e7b2e0fa247a0a93/engine/defoldsdk.zip"
	"http://d.defold.com/archive/stable/8eaab6b1281ce492163428e0e7b2e0fa247a0a93/bob/bob.jar"
	"Defold.desktop"
	"LICENSE"
	"logo.zip")
noextract=("bob.jar")
md5sums=("3ef08955cec178eb72011892eb784e0a"
	"77fa288721ee472e9b8a15f55b3d5a7a"
	"ac1d334bb87d9f0a3a0afe6db8ff1635"
	"9cb098ede9ab28bce8f3e0142eb7a659"
	"12ddd6bdaaf6397931608af50492f005"
 	"2e220c9bf4a7e2f5aa3b81cfd7b8c8fe")
validpgpkeys=()

package() {
	cd "$srcdir"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 Defold.desktop "$pkgdir/usr/share/applications/Defold.desktop"
	install -Dm644 "logo/64.png" "$pkgdir/usr/share/icons/hicolor/64x64/apps/defold.png"
	install -Dm644 "logo/128.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/defold.png"
	install -Dm644 "logo/150.png" "$pkgdir/usr/share/icons/hicolor/150x150/apps/defold.png"
	install -Dm644 "logo/310.png" "$pkgdir/usr/share/icons/hicolor/310x310/apps/defold.png"
	install -Dm644 "logo/1024.png" "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/defold.png"
	mkdir -p "$pkgdir/opt/Defold"
	cp -r Defold "$pkgdir/opt"
	cp -r defoldsdk "$pkgdir/opt/Defold"
	mkdir -p "$pkgdir/usr/include/dmsdk"
	ln -s "$pkgdir/opt/Defold/defoldsdk/sdk/include/dmsdk" "$pkgdir/usr/include/dmsdk"
	install -Dm644 bob.jar "$pkgdir/opt/Defold"
}
