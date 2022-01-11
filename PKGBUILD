# Maintainer: zneix <zneix@zneix.eu>

pkgname=haste-client-git
pkgver=r11.00dea98
pkgrel=2
pkgdesc='A little utility for uploading code to hastebin server, written in Go.'
arch=('x86_64')
url=https://github.com/zneix/haste-client
license=('AGPL3')
depends=()
makedepends=('go' 'git' 'make')
provides=('haste')
conflicts=('haste-client' 'haste-client-bin')
options=()
changelog=$pkgname.changelog
source=('haste-client::git+https://github.com/zneix/haste-client.git')
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/haste-client"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/haste-client"
    go build -o haste
}

package() {
    cd "$srcdir/haste-client"
    install -Dm 755 haste "$pkgdir/usr/bin/haste"
}
