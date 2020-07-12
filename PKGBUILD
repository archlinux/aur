# Maintainer: Jojii <jojii@gmx.net>
pkgname=datamanager-cli-git
pkgver=1.7.r284.1b67832
pkgrel=1
epoch=
pkgdesc="The official cli client for the datamanager system"
arch=('i686' 'x86_64')
url="https://github.com/DataManager-Go/DataManagerCLI"
license=('MIT')
groups=()
depends=()
makedepends=(
    'git'
    'go'
)

options=()
install=
changelog=
source=("git+$url")
md5sums=("SKIP")

pkgver() {
	cd "$srcdir/DataManagerCLI"
	printf "1.7.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/DataManagerCLI"
	go build -o manager
}

package() {
	cd "$srcdir/DataManagerCLI"
        mkdir -p $pkgdir/usr/bin
        install -DT manager $pkgdir/usr/bin/manager
}
