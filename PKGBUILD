# Maintainer: Yufan You <ouuansteve at gmail>

_npmname=language-server
_npmscope=@vue
pkgname=vue-language-server-bin
_pkgname=vue-language-server
pkgver=1.8.0
pkgrel=1
pkgdesc='High-performance Vue language tooling based-on Volar.js'
arch=('any')
url='https://github.com/vuejs/language-tools/tree/master/packages/vue-language-server'
license=('MIT')
depends=('nodejs')
makedepends=('npm')
provides=("$_pkgname")
conflicts=("$_pkgname")
replaces=('volar-server' 'volar-server-bin')
source=("https://registry.npmjs.org/$_npmscope/$_npmname/-/$_npmname-$pkgver.tgz")
noextract=("$_npmname-$pkgver.tgz")
sha256sums=('f86562f945b33cd280cb01acc8d724ac534056a31672caf3a26178176198b807')

package() {
    cd "$srcdir"
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$srcdir/$_npmname-$pkgver.tgz"
    chown -R root:root "${pkgdir}"
    install -Dm644 "$_npmdir/$_npmscope/$_npmname/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
