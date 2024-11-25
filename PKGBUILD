
# Maintainer: Prasanth Baskar <bupdprasanth@gmail.com
# Lakshmanan lakshmanoni1234@gmail.com
pkgname=git-donkey
pkgver=1.0.0
pkgrel=2
pkgdesc="A Donkey Don to help you manage your local git branches/repositories."
arch=('x86_64')
url="https://github.com/bupd/git-donkey"
license=('MIT')
depends=('git')
makedepends=('go') # Required to build Go projects
source=("git-donkey::git+https://github.com/bupd/git-donkey.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    go build -o "$pkgname" # Build the binary
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname" # Install the binary
}

