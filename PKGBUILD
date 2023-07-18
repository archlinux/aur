# Maintainer: Victor Tran <vicr12345 at gmail dot com>

wayland_protocols_version=1.25

pkgname=libtdesktopenvironment
pkgver=1.0
pkgrel=1
pkgdesc="Common libraries for desktop integration for the- apps"
arch=("x86_64" "aarch64")
url="https://github.com/vicr123/libtdesktopenvironment"
license=('GPL3')
depends=('libcontemporary' 'glib2' 'libx11' 'libxss' 'libxext' 'libxrandr')
makedepends=('git' 'qt6-tools' 'cmake' 'clang')
source=("libtdesktopenvironment"::"https://github.com/theCheeseboard/libtdesktopenvironment/archive/v$pkgver.tar.gz"
#         "git+https://gitlab.freedesktop.org/wayland/wayland-protocols.git"
#         "git+https://github.com/swaywm/wlr-protocols.git"
)
sha256sums=('a9ed005f0bcf429baa8c0e0ebd3a443947443c0a67ccef4680395497d9a5a777'
#             'SKIP'
#             'SKIP'
)

# prepare() {
#     cd libtdesktopenvironment
#     git submodule init
#     git config submodule.lib/wayland-protocols/wayland-protocols.url "$srcdir/wayland-protocols"
#     git config submodule.lib/wayland-protocols/wlr-protocols.url "$srcdir/wlr-protocols"
#     git -c protocol.file.allow=always submodule update
# }

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install "build"
}
