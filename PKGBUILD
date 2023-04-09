# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgname=sigmafetch
pkgver=1.0.r6.076cf2a
pkgrel=1
epoch=
pkgdesc="a Neofetch-like program written in Rust"
arch=(x86_64)
url="https://github.com/JafKc/sigmafetch.git"
license=('unknown')
groups=()
depends=()
makedepends=(git cargo)
checkdepends=()
optdepends=()
provides=(sigmafetch)
conflicts=(sigmafetch)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	cargo build --release
}


package() {
	cd "$pkgname/target/release"
	install -Dm755 ./sigmafetch "$pkgdir/usr/bin/sigmafetch"
}
