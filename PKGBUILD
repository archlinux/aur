# Maintainer: Radu Potop <radu@wooptoo.com>
# Contributor: Stefan Tatschner <stefan@rumpelsepp.org>

pkgname=msgspec
pkgver=0.13.1
pkgrel=1
pkgdesc='A fast serialization and validation library for Python, with builtin support for JSON, MessagePack, YAML, and TOML'
arch=(any)
url="https://github.com/jcrist/msgspec"
license=("BSD")
depends=("python")
conflicts=("python-msgspec")
provides=("python-msgspec")
makedepends=("python-build" "python-installer" "git")
source=("${url}/archive/refs/tags/${pkgver}.tar.gz")

build() {
    cd "$pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}

sha256sums=('afc9d3abdce45acbb26a9dedafafd614a7f12e1f09edbe45f751b4bb914674bd')
