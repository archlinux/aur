# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=unocss-language-server
pkgname=unocss-language-server-bin
_pkgname=unocss-language-server
pkgver=0.1.0
pkgrel=1
pkgdesc='A language server for unocss'
arch=('any')
url='https://github.com/xna00/unocss-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("https://registry.npmjs.org/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('d514136e0e0811be6787512d72879fb467fe856cfc45b5e6e9fb1eb7cfb4026e')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
