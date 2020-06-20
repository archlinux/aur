pkgname=elm-live
pkgver=4.0.1
pkgrel=1
pkgdesc="A flexible dev server for Elm"
arch=(any)
url="https://github.com/architectcodes/elm-live"
license=()
depends=('nodejs' 'npm' 'elm-platform')
optdepends=()
options=(!strip)

package() {
    npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
