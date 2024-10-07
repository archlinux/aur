# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak-bin
pkgver=2.4.0
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots<0.19.0' 'pango')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak/releases/download/$pkgver/release-artefacts_$pkgver.tar.gz")
options=('!buildflags' '!strip')
conflicts=('cagebreak')
sha512sums=('5e0cc21617fc03aa53be074dc00b70cc368a4e5eca819b211aba1739612f98d99904e24172b94d6df3b38539780443f4e1d86aa6b3e8ad4786774caa6a892e45')
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
