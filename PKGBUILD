# Maintainer: Kimiblock Moe
pkgname=portable
pkgver=2.16
pkgrel=1
epoch=
pkgdesc="Portable Sandboxing framework"
arch=('any')
url="https://github.com/Kraftland/portable"
license=(GPL-3.0-or-later)
provides=(portable)
groups=()
options=(!debug !strip)

makedepends+=(git)

depends=(
	"pipewire-v4l2"
	"procps-ng"
	"coreutils"
	"awk"
	"xxd"
	"xorg-xauth"
	"xdg-user-dirs"
	"xorg-xhost"
	"zenity"
	"xdg-dbus-proxy"
	"nss"
	"bubblewrap"
	"xcb-util-keysyms"
	"xcb-util-image"
	"xcb-util-wm"
	"libxcb"
	"util-linux"
	"openssl"
	"libxcb"
	"gcc-libs"
	"nspr"
	"bzip2"
	"glibc"
	"zlib"
	"libxcomposite"
	"glib2"
	"wayland"
	"libxrender"
	"libxext"
	"dbus"
	"libxrandr"
	"fontconfig"
	"pango"
	"freetype2"
	"libxfixes"
	"cairo"
	"expat"
	"libxdamage"
	"libdrm"
	"bash"
	"lsb-release"
	"psmisc"
	"flatpak-xdg-utils"
	"xdg-desktop-portal"
	"xdg-desktop-portal-gtk"
)

optdepends=(
	'at-spi2-core: accessibility'
	'orca: screen reader'
)

makedepends+=(
	"libarchive"
)

checkdepends=()

source=(git+https://codeberg.org/Kimiblock/portable.git#tag=${pkgver})

md5sums=('674d0ab8fc439624467cecf592d56645')


function package() {
	cd "${srcdir}/portable"
	install -Dm755 portable.sh ${pkgdir}/usr/bin/portable
	install -Dm755 open.sh ${pkgdir}/usr/lib/portable/open
	install -Dm755 user-dirs.dirs ${pkgdir}/usr/lib/portable/user-dirs.dirs
	install -Dm755 mimeapps.list ${pkgdir}/usr/lib/portable/mimeapps.list
	install -Dm755 flatpak-info ${pkgdir}/usr/lib/portable/flatpak-info
	install -Dm755 bwrapinfo.json ${pkgdir}/usr/lib/portable/bwrapinfo.json
}
