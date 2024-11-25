
# Maintainer: Prasanth Baskar <bupd@gmail.com>
pkgname=git-donkey
pkgver=1.0.0
pkgrel=1
pkgdesc="A tool to help maintain your local git branch updated with the remote repository"
arch=('any')
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

