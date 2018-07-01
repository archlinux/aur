# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
pkgname=reason-cli
pkgver=3.2.0
_npmver="${pkgver}-linux"
pkgrel=1
arch=(any)
url="https://reasonml.github.io/"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
    npm install -g --prefix "$pkgdir/usr" "${pkgname}@${_npmver}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
