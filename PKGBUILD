# Maintainer: Jojii <jojii@gmx.net>
pkgname=logo-ls
pkgver=1.3.5
pkgrel=2
pkgdesc="Modern ls command with vscode like file icon and git integrations"
arch=('i686' 'x86_64')
url="https://github.com/Yash-Handa/logo-ls"
license=('MIT')
groups=()
depends=()
makedepends=(
    'git'
    'go'
)

options=()
source=("git+$url")
md5sums=('SKIP')

prepare() {
    cd "$pkgname"
    go mod tidy
}

build() {
	cd "$pkgname"
	go build
}

package() {
	cd "$pkgname"
    install -DT logo-ls $pkgdir/usr/bin/logo-ls
}
