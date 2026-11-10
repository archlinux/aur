# Maintainer: hyperpuncher
pkgname=stuff-bin
pkgver=0.2.0
pkgrel=1
pkgdesc='lightweight file manager'
arch=('x86_64' 'aarch64')
url='https://github.com/hyperpuncher/stuff'
license=('MIT AND Zlib AND ISC')
depends=('dbus' 'fontconfig' 'glibc' 'hicolor-icon-theme' 'sdl3'
	'sdl3_image' 'sdl3_ttf' 'systemd-libs' 'ttf-font' 'udisks2' 'wayland' 'xdg-utils')
optdepends=('polkit-agent: authentication prompts for protected storage operations'
	'xdg-desktop-portal: application chooser and desktop font settings')
provides=("stuff=$pkgver")
conflicts=('stuff')
options=('!strip' '!debug')
source_x86_64=("$pkgname-$pkgver-linux-x64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-x64.tar.zst")
source_aarch64=("$pkgname-$pkgver-linux-arm64.tar.zst::$url/releases/download/v$pkgver/stuff-linux-arm64.tar.zst")
sha256sums_x86_64=('28bc9de569dc022ecba09312dadc0af3439e188f98afe1d824f4799a164498cb')
sha256sums_aarch64=('f35da876c20076362c75e01e088650f7f8d7b610d01cd29b302896ce402c8f92')

package() {
	cd "$srcdir" || return 1
	sh packaging/linux/install.sh "$pkgdir" "$pkgname"
}
