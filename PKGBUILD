# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Mario Finelli <mario at finel dot li>

_npmname=foundation-cli
pkgname=nodejs-foundation-cli
pkgver=2.2.6
pkgrel=1
pkgdesc="The command line installer for Foundation Sites, Emails, Apps."
arch=('any')
url="https://github.com/foundation/foundation-cli"
license=('MIT')
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('d5fe338fb0056fbba4cc8ee50dabff80a040a8ca694a163f17947c4cf9cbf80f')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$_npmname@$pkgver"
    chown -R root:root "${pkgdir}"
}
