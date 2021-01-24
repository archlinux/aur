# Maintainer: project-repo <archlinux-aur@project-repo.co>
pkgname=cagebreak-bin
pkgver=1.5.1
pkgrel=1
pkgdesc='Tiling wayland compositor based on cage inspired by ratpoison'
arch=('x86_64')
url='https://github.com/project-repo/cagebreak'
license=('MIT')
depends=('wayland' 'libxkbcommon' 'wlroots' 'pango')
optdepends=('wl-clipboard: clipboard support'
            'xorg-xwayland: x application support')
source=("$pkgname-$pkgver.tar.gz::https://github.com/project-repo/cagebreak-pkgbuild/releases/download/$pkgver/release_bin_$pkgver.tar.gz")
options=('!buildflags' '!strip')
conflicts=('cagebreak')
sha512sums=('d16d069625fea76091f1de3369b0ea8edbfc1e7bbb92040cd64207f91353bbf37db4b65151f9b61a2982757282ed60c0a559ba77224824f50dbd343502594d8e')
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
