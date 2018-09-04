pkgname=elm-upgrade
pkgver=0.19.6
pkgrel=1
pkgdesc="Upgrade Elm projects"
arch=(any)
url="https://github.com/avh4/elm-upgrade"
license=()
depends=('nodejs' 'npm')
optdepends=()
options=(!strip)

package() {
    npm install -g --prefix "$pkgdir/usr" $pkgname@$pkgver
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
