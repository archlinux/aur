# Maintainer: ThatOneCalculator <kainoa@t1c.dev>

_pkgname="hyprland"
pkgname="${_pkgname}-bin"
pkgver="0.6.0beta"
pkgrel=1
pkgdesc="A dynamic tiling Wayland compositor based on wlroots that doesn't sacrifice on its looks."
arch=('x86_64' 'i686')
url="https://github.com/vaxerski/Hyprland"
license=('BSD')
depends=(
	libxcb
	xcb-proto
	xcb-util
	xcb-util-keysyms
	libxfixes
	libx11
	libxcomposite
	xorg-xinput
	libxrender
	pixman
	wayland-protocols
	cairo
	pango
	polkit
	glslang
	libinput
	libxcb
	libxkbcommon
	opengl-driver
	pixman
	wayland
	xcb-util-errors
	xcb-util-renderutil
	xcb-util-wm
	seatd
	vulkan-icd-loader
	vulkan-validation-layers
	xorg-xwayland)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/vaxerski/Hyprland/releases/download/v${pkgver}/v${pkgver}.tar.gz")
sha256sums=('448779ff9dddaaf4c88ff8a678aedec0835a92ad1967359e9d85c6b10ee58ba6')
conflicts=("${_pkgname}")
provides=(hyprland)

package() {
	mkdir -p "${pkgdir}/usr/share/wayland-sessions"
	mkdir -p "${pkgdir}/usr/share/hyprland"
	install -Dm755 ./Hyprland -t "${pkgdir}/usr/bin"
	install -Dm755 ./hyprctl -t "${pkgdir}/usr/bin"
	install -Dm755 ./libwlroots.so.11032 -t "${pkgdir}/usr/lib"
	install -Dm644 assets/*.png -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 example/hyprland.desktop -t "${pkgdir}/usr/share/wayland-sessions"
	install -Dm644 example/hyprland.conf -t "${pkgdir}/usr/share/hyprland"
	install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
