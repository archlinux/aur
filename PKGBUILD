# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Pietro <yexmaintainer@protonmail.com>
pkgname=yex-git
pkgver=0.1.r128.6a6648a
pkgrel=1
epoch=
pkgdesc="Yex programming language created by nonamescm"
arch=(x86_64)
url="https://github.com/nonamescm/yex-lang"
license=('MIT')
groups=()
depends=()
makedepends=(git rustup)
checkdepends=()
optdepends=()
provides=(yex)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "yex-lang"
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

build() {
	cd "yex-lang"
	cargo install --path yex --force
}


package() {
	echo "add ~/.cargo/bin into your path in order to run yex" 
}
