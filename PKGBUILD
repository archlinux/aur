# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=unocss-language-server
pkgname=unocss-language-server-bin
_pkgname=unocss-language-server
pkgver=0.1.6
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
sha256sums=('f1b97c556d1529d1c75e6c5fcc628ad2df1ba0a4d1042915e71e09aed18069ed')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
