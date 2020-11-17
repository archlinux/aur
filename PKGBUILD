# Maintainer: Duologic <jeroen@simplistic.be>

_npmname=git-file-history
pkgname=nodejs-"$_npmname"
pkgver=1.0.1
pkgrel=0
pkgdesc='Quickly browse the history of a file from any git repository.'
arch=('any')
url="https://github.com/pomber/git-history/tree/master/cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
sha256sums=('0a2705cfd57021c715b3bef53a2bfbc564923afa739374802a54d94c75c85592')
noextract=("${source[@]##*/}")

package() {
    npm install -g --user root --cache "$srcdir/npm-cache" --prefix "$pkgdir/usr" "${source[@]##*/}"
    find "$pkgdir"/usr -type d -exec chmod 755 {} +
}
