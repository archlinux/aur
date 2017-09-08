# Maintainer: Merrick Luo <merrick@luois.me>
pkgname=vysor
pkgver=r126.0fc1842
pkgrel=1
epoch=
pkgdesc="Vysor lets you view and control your Android on your computer. Easy peasy."
arch=("x86_64")
url="https://github.com/koush/electron-chrome"
license=("MIT")
groups=()
depends=("nodejs")
makedepends=("git" "npm")
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://github.com/koush/electron-chrome#branch=master"
        "vysor.desktop"
        "vysor.png"
        "vysor.sh")
noextract=()
md5sums=("SKIP"
         "d4e9a9dd54eb49e556ea9784f3d1fce4"
         "65fe8e05a060de9356a269524434cea9"
         "db9cb80a6d385f8c1b06b5555b8daad2")
validpgpkeys=()

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$pkgname"
	npm install
}

package() {
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/usr/share/applications
	mkdir -p "$pkgdir"/usr/share/icons
	mkdir -p "$pkgdir"/opt

	cp -r "$pkgname" "$pkgdir"/opt/
	cp vysor.sh "$pkgdir"/usr/bin/vysor
	cp vysor.desktop "$pkgdir"/usr/share/applications/
	cp vysor.png "$pkgdir"/usr/share/icons/
}
