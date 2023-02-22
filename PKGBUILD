# Maintainer: Nox04 <contact@juanangarita.com>
pkgname=crypto-tracker-git
pkgver=0.1.r4.b518842
pkgrel=1
epoch=
pkgdesc="This program allows you to track the value of multiple cryptocurrencies and output a JSON object that you can use in Waybar or similar programs."
arch=('x86_64')
url="https://github.com/Nox04/crypto-tracker.git"
license=('MIT')
groups=()
depends=()
makedepends=('go' 'git')
checkdepends=()
optdepends=()
provides=(crypto-tracker)
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
	cd crypto-tracker
	printf "0.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd crypto-tracker
	go build -o crypto-tracker
}

package() {
	cd crypto-tracker
	install -Dm755 crypto-tracker -t "$pkgdir"/usr/bin/crypto-tracker
}
