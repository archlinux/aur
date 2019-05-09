# Maintainer: Alastair Pharo <me at asph dot dev>
pkgname=archlinux-nix-git
pkgver=r23.53510eb
pkgrel=1
pkgdesc="A command-line tool for setting up Nix on Arch Linux"
arch=('any')
url="https://github.com/asppsa/archlinux-nix"
licese=('Apache')
groups=()
depends=()
makedepends=('git')
provides=("archlinux-nix")
conflicts=("archlinux-nix")
replaces=()
backup=()
options=()
install=
source=('git+https://github.com/asppsa/archlinux-nix.git')
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/${pkgname%-git}"
	make DESTDIR="$pkgdir/" install
}
