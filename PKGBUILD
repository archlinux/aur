# Maintainer: Diab Neiroukh <lazerl0rd at thezest dot dev>

pkgname="gnome-shell-extension-blyr"
pkgver=8
pkgrel=2
epoch=1
arch=("any")
pkgdesc="A GNOME extension that applies a blur effect to GNOME Shell UI elements."
url="https://github.com/yozoon/gnome-shell-extension-blyr"
license=("GPL2")
depends=(
	"gnome-shell>=3.34"
)
makedepends=(
	"unzip"
)
optdepends=(
	"clutter-gtk: required to configure GNOME Shell extensions."
)
source=(
	"https://github.com/yozoon/gnome-shell-extension-blyr/releases/download/v$pkgver/blyr@yozoon.dev.gmail.com.zip"
)
noextract=(
	"blyr@yozoon.dev.gmail.com.zip"
)
b2sums=(
	"bed0fc8c61585248312bcbb0dcf4ae282d2c79aef58df446660060476d6e66446d52409ca9b0d7d64807ebb1ee2e046572f97d82d74fcb203f68935a27ff55ed"
)

prepare()
{
	install -d "gnome-shell-extension-blyr"
	unzip "blyr@yozoon.dev.gmail.com.zip" -d "gnome-shell-extension-blyr"
}

package()
{
	install -d "$pkgdir/usr/share/gnome-shell/extensions/blyr@yozoon.dev.gmail.com"
	cp -r "gnome-shell-extension-blyr/"* "$pkgdir/usr/share/gnome-shell/extensions/blyr@yozoon.dev.gmail.com"
}
