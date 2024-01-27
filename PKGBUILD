# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak-bin
pkgver=2.3.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots<0.18.0' 'pango')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release-artefacts_$pkgver.tar.gz")
options=('!buildflags' '!strip')
conflicts=('cagebreak')
sha512sums=('fabbbe6d9492fd02fad8237c35bfbd1fc7086403b8dac760ac285e0ae2f80333d44accb36e1d3d1674e7c343d023f8b480b345b42271c950fcc981b5f772be00')
package() {
	cd release-artefacts_$pkgver
	mkdir -p "$pkgdir/usr/bin/"
	cp 'cagebreak' "$pkgdir/usr/bin/"
	mkdir -p "$pkgdir/usr/share/licenses/$pkgname/"
	mkdir -p "$pkgdir/usr/share/man/man1/"
	mkdir -p "$pkgdir/usr/share/man/man5/"
	mkdir -p "$pkgdir/usr/share/man/man7/"
	cp 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/"
	cp 'cagebreak.1' "$pkgdir/usr/share/man/man1/"
	cp 'cagebreak-config.5' "$pkgdir/usr/share/man/man5/"
	cp 'cagebreak-socket.7' "$pkgdir/usr/share/man/man7/"
}
