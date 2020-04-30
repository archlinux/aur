# Maintainer: Diab Neiroukh <officiallazerl0rd@gmail.com>

pkgname="gnome-shell-extension-blyr"
pkgver=7
pkgrel=1
epoch=1
pkgdesc="Apply a Blur Effect to GNOME Shell UI elements"
arch=(
	"any"
)
url="https://github.com/yozoon/gnome-shell-extension-blyr"
license=(
	"GPL"
)
depends=(
	"gnome-shell>=3.34"
)
optdepends=(
	"clutter-gtk: configuring blyr"
)
makedepends=(
	"unzip"
)
source=(
	"https://github.com/yozoon/gnome-shell-extension-blyr/releases/download/v$pkgver/blyr@yozoon.dev.gmail.com.zip"
)
noextract=(
	"blyr@yozoon.dev.gmail.com.zip"
)
b2sums=(
	"d4d56d889bc3fe59abafd9b54f71e666dd8651ad7bab9bbae830f95f09c948417ad67906f9cd6a903610df882dd534f4303fec87877641a808843aae3353a3ea"
)

prepare()
{
	install -d "gnome-shell-extension-blyr"
	unzip "blyr@yozoon.dev.gmail.com.zip" -d "gnome-shell-extension-blyr"
}

package()
{
    local _uuid="blyr@yozoon.dev.gmail.com"

	install -d "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
	cp -r "gnome-shell-extension-blyr/"* "$pkgdir/usr/share/gnome-shell/extensions/$_uuid"
}
