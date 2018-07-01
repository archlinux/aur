# Maintainer: Jonas Schürmann <jonasschuermann@aol.de>
pkgname=bs-platform
pkgver=3.1.5
pkgrel=1
pkgdesc="BuckleScript: A JavaScript backend for OCaml focused on smooth integration and clean generated code."
arch=(any)
url="https://bucklescript.github.io/"
license=()
depends=('nodejs' 'npm' )
optdepends=()
options=(!strip)

package() {
    npm install -g --prefix "$pkgdir/usr" "${pkgname}@${pkgver}"
    # Non-deterministic race in npm gives 777 permissions to random directories.
    # See https://github.com/npm/npm/issues/9359 for details.
    find "${pkgdir}"/usr -type d -exec chmod 755 {} +
}
