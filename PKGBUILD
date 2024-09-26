# Maintainer: Glucy2 <glucy-2@outlook.com>
# Contributor: fantasyzhjk <fantasyzhjk@outlook.com>

pkgname=mcping-git
pkgver=20240908
pkgrel=1
pkgdesc="Ping any Minecraft server."
arch=('any')
license=('MIT')
url='https://github.com/Tnze/go-mc/tree/master/examples/mcping'
makedepends=('go' 'git')

source=(
    "git+https://github.com/Tnze/go-mc.git"
)

sha256sums=(
    'SKIP'
)

pkgver() {
    cd "$srcdir/go-mc/examples/mcping"
    git log -1 --format="%cd" --date=short | sed s/-//g
}

build() {
    cd "$srcdir/go-mc/examples/mcping"
    go build
}

package() {
    install -Dm755 "$srcdir/go-mc/examples/mcping/mcping" "$pkgdir/usr/bin/mcping"
}
