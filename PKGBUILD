# Maintainer: water_lift <0xWATERx0@gmail.com>
pkgname=defold
pkgver=1.4.2
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
source=("http://d.defold.com/archive/editor-alpha/8cd3a634b13f4db51a37607bf32bf3a3b362c8e6/editor-alpha/editor2/Defold-x86_64-linux.zip"
	"http://d.defold.com/archive/stable/8cd3a634b13f4db51a37607bf32bf3a3b362c8e6/engine/defoldsdk.zip"
	"http://d.defold.com/archive/stable/8cd3a634b13f4db51a37607bf32bf3a3b362c8e6/bob/bob.jar"
	"Defold.desktop"
	"LICENSE"
	"logo.zip")
noextract=("bob.jar")
md5sums=("7144c55e533386641713e45e52490f75"
	"40c0925aaeb670353a22b6c248a7e421"
	"e12a06b05898d41bd4370de78958ab49"
	"ef79a33c3097a2da95a9a968ec49ffb3"
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
