pkgname=python-exitcode
_pkgname=exitcode
pkgver=0.1.0
pkgrel=1
pkgdesc='Preferred system exit codes as defined by sysexits.h '
arch=(any)
url="https://github.com/rumpelsepp/exitcode"
license=("MIT")
depends=(
    "python"
)
makedepends=("python-build" "python-installer" "git")
source=("https://github.com/rumpelsepp/exitcode/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('2a6801a11fcd7fd49bd72223b121eacc2a940859d2714b5e64c82f88ab13515f')

build() {
    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
