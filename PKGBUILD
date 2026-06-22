# Maintainer: Miranda Collins (serqetry) <miranda@xyla.net>
pkgname=stellar-desktop-git
pkgver=r2.94d3fcb
pkgrel=1
pkgdesc="Stellar Desktop Environment"
arch=('x86_64')
url="https://github.com/miranda/stellar.git"
license=('Apache-2.0')

depends=(
	'lua54'
	'lua54-socket'
	'lua54-dkjson'
	'libxcb'
	'xcb-util'
	'xcb-util-keysyms'
	'libxkbcommon'
	'libxkbcommon-x11'
	'cairo'
	'freetype2'
	'libdrm'
	'libpciaccess'
	'libx11'
	'libxrandr'
	'libxcursor'
	'libxi'
	'libxext'
	'polkit'
	'fontconfig'
	'xorg-fonttosfnt'
	'glib2'
	'systemd-libs'
	'atch-stellar-git'
	'awesome-stellar-git'
	'picom'
	'stalonetray'
)

optdepends=(
    'xscreensaver-hacks: required for the integrated screensaver (recommended)'
    'xscreensaver: alternative for the integrated screensaver'
)
makedepends=('git' 'gcc' 'make' 'pkgconf')

source=("git+https://github.com/miranda/stellar.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/stellar"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/stellar"
    make PREFIX=/usr
}

package() {
    cd "$srcdir/stellar"
    make DESTDIR="$pkgdir" PREFIX=/usr install
}
