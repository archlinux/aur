# Contributor: wisp3rwind <17089248+wisp3rwind@users.noreply.github.com>

pkgname=beets-alternatives
pkgver=0.14.0
pkgrel=1
pkgdesc="Beets plugin to manage external files"
arch=('any')
url="https://github.com/geigerzaehler/${pkgname}"
license=('MIT')
depends=('python' 'beets>=1.6.0')
makedepends=(python-build python-installer python-wheel python-hatchling)
source=(${pkgname}-${pkgver}.tar.gz::"${url}/archive/v${pkgver}.tar.gz")
b2sums=('9d056c8a030621a40b17270793158e7b49c3d6a8c07ab000f3eddb93505a00b8828f79259a8d6f396d2b98809647535451fe001f84812348d88526ee7fd325cc')

build() {
    cd ${pkgname}-${pkgver}
    python -m build --wheel --no-isolation
}

package() {
    cd ${pkgname}-${pkgver}
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}

# vim: set et sw=4 ts=4 :
