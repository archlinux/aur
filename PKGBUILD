# Maintainer: Miskolczi Richárd <miskolczi.richard@protonmail.com>
pkgname=hyprland-toggle-tiling-git
pkgver=1.1.0
pkgrel=1.1
pkgdesc="A simple program to toggle tiling and floating modes for windows in the Hyprland Wayland compositor."
arch=('x86_64')
url="https://github.com/TypoMustakes/hyprland-toggle-tiling"
source=("git+https://github.com/TypoMustakes/hyprland-toggle-tiling.git")
license=('GPL3')
depends=('hyprland')
makedepends=('cmake' 'git')
sha256sums=('SKIP')

build() {
	cd "$srcdir/hyprland-toggle-tiling"
	cmake -B build -DCMAKE_BUILD_TYPE=Release
	cmake --build build
}

package() {
	cd "$srcdir/hyprland-toggle-tiling"
	install -Dm755 build/htt "$pkgdir/usr/bin/htt"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
