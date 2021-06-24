# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Daniel Nagy <danielnagy at gmx de>
# Contributor: Jeremy Ashkenas
# Contributor: jashkenas <jashkenas@gmail.com>

_npmname=docco
pkgname=nodejs-docco
pkgver=0.8.1
pkgrel=2
pkgdesc="Literate Programming can be Quick and Dirty."
arch=(any)
url="https://github.com/jashkenas/docco"
license=(MIT)
depends=('nodejs')
makedepends=('npm')
source=(https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz)
noextract=($_npmname-$pkgver.tgz)
sha256sums=('f887106ec47a2068fbc2ec21cbbfa20d62edb7cbfb98220d08f95e58830634a5')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    chown -R root:root "${pkgdir}"
}
