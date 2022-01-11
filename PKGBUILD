# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=foundation-cli
pkgname=nodejs-foundation-cli
pkgver=2.3.2
pkgrel=1
pkgdesc="The command line installer for Foundation Sites, Emails, Apps."
arch=('any')
url="https://github.com/foundation/foundation-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('6fdcf8de64132e0cf79ea01e0d7a8348e4879fccc7780595388a84e5a46e61c5')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
}
