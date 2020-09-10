# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak-bin
pkgver=1.4.0
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
sha512sums=('f2fcaf4a93d399ffbd3f01c99cb897642d45e55c7f5205f6b008766966aec794b161c1d6ab89e508f2c789d098f63b2790d7abd7e57ce127ec844efada4cf5c1')
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
