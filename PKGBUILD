# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=foundation-cli
pkgname=nodejs-foundation-cli
pkgver=2.3.0
pkgrel=1
pkgdesc="The command line installer for Foundation Sites, Emails, Apps."
arch=('any')
url="https://github.com/foundation/foundation-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('6288b1bbd60ac86ea3ba8b716b21f8e123ed9dfdc8bd7d03131cdf1e034535fd')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
}
