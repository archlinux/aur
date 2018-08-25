_npmname=create-elm-app
_npmver=1.10.4
pkgname=create-elm-app
pkgver=1.10.4
pkgrel=2
pkgdesc="Create Elm apps with zero configuration"
arch=(any)
url="https://github.com/halfzebra/create-elm-app"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
    npm install -g --prefix "$pkgdir/usr" $_npmname@$_npmver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
