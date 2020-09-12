# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak-bin
pkgver=1.4.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots' 'pango')
optdepends=('wl-clipboard: clipboard support'
            'xorg-server-xwayland: x application support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak-pkgbuild/releases/download/$pkgver/release_bin_$pkgver.tar.gz")
options=('!buildflags' '!strip')
conflicts=('cagebreak')
sha512sums=('9293413732d19ec9d9de48a01d2148eff9f3d0b02c50db7a6719a66e781f3686e0a1d14439a1046f095a2bf6d6a9a33655e63ec55783bfb4dddf8a45d4051f13')
package() {
	cd "$pkgname"
	mkdir -p "$pkgdir/usr/bin/"
	cp 'cagebreak' "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	mkdir -p "$pkgdir/usr/share/man/man5/"
	cp 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"
	cp 'cagebreak.1' "$pkgdir/usr/share/man/man1/"
	cp 'cagebreak-config.5' "$pkgdir/usr/share/man/man5/"
}
