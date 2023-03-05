# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=unocss-language-server
pkgname=unocss-language-server-bin
_pkgname=unocss-language-server
pkgver=0.0.9
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
sha256sums=('ffec264277192991b96177809c5537eef0629209e3a3ef5b7cb1ead521fcb4c7')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
