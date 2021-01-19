# Maintainer: Jojii <jojii@gmx.net>
pkgname=logo-ls
pkgver=1.3.7
pkgrel=1
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
source=("https://github.com/Yash-Handa/logo-ls/archive/v${pkgver}.tar.gz")
md5sums=('62da2311badaa1445312e63b4232991c')

prepare() {
    cd "$pkgname"-"$pkgver"
    go mod tidy
}

build() {
    cd "$pkgname"-"$pkgver"
	go build
}

package() {
    cd "$pkgname"-"$pkgver"
    install -DT logo-ls $pkgdir/usr/bin/logo-ls
    install -DT LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
