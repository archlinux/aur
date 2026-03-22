# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
_name=snakemake-interface-logger-plugins
pkgname=python-$_name
pkgver=2.0.1
pkgrel=1
pkgdesc="Snakemake Logger Plugin Interface"
arch=('any')
url=https://github.com/snakemake/snakemake-interface-logger-plugins
license=('MIT')
depends=(python-snakemake-interface-common)
makedepends=(python-build python-installer python-wheel python-hatchling)
source=($_name-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('aba9ecc7a6bc47da5dbb5bcc41b822326bc70b4bba254a06e906bcfde7ee26f6')

build() {
    cd "$_name-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "$_name-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
