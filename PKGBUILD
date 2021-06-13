# Maintainer: Leonardo Eugênio <lelgenio@disroot.org>
pkgname=emmet-cli
pkgver=1.2.1
pkgrel=1
pkgdesc="Emmet command line interface"
arch=(any)
url="https://github.com/Delapouite/emmet-cli"
license=('ISC')
depends=('nodejs')
makedepends=('npm')
optdepends=()
source=(https://registry.npmjs.org/$pkgname/-/$pkgname-$pkgver.tgz)
noextract=($pkgname-$pkgver.tgz)
md5sums=('143d40ced6a56a989074987b51a17c52')

package() {
    local _npmdir="$pkgdir/usr/lib/node_modules/"
    mkdir -p "$_npmdir"
    cd "$_npmdir"
    npm install -g --prefix "$pkgdir/usr" "$pkgname@$pkgver"

    # npm gives ownership of ALL FILES to build user
    chown -R root:root "$pkgdir"

    # Add license
    # Awaiting for it to be writen by project creator
    # install -Dm644 "$pkgdir/usr/lib/node_modules/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
