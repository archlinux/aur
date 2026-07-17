# Maintainer: Kaley Burdow <kaleidox@comroid.org>

pkgname=trie-git
pkgver=0.1
pkgrel=1
pkgdesc="CLI trie displaying tool"
arch=('any')
url="https://git.comroid.org/comroid/trie"
license=('GPL-3.0')
depends=('dotnet-runtime-10.0')
makedepends=('dotnet-sdk-10.0')
source=("git+https://git.comroid.org/comroid/trie.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd trie
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "trie/trie/bin/Release/net10.0/linux-x64/publish/trie" "$pkgdir/usr/bin/trie"
}
