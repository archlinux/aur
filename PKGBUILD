# Maintainer: Mark Wells <contact@markwells.dev>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=keeper-secrets-manager-storage
pkgver=1.0.2
pkgrel=1
pkgdesc="Keeper Secrets Manager SDK helper for managing configurations key-value storage"
arch=('any')
url="https://github.com/Keeper-Security/secrets-manager"
license=('MIT')
depends=('python')
makedepends=(
    'python-build'
    'python-installer'
    'python-setuptools'
)
source=("https://files.pythonhosted.org/packages/9b/f9/e6bdac16ee384e4c5a788cb3c24568376ce91a3b093cfcceb0f21a867439/keeper-secrets-manager-storage-$pkgver.tar.gz")
sha512sums=('2b6244c4545c6f0757a5fe3a8426f0ec6d64b7eaa7c098b6ddfd91714a3d722a40c0fee1634a851f24f4765a8540d763b3461ccb73111b9b1bb7a9b89a4e096f')

build() {
    cd "keeper-secrets-manager-storage-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
    cd "keeper-secrets-manager-storage-$pkgver"
    python -m installer --destdir="$pkgdir" dist/*.whl
}
# vim:set ts=2 sw=2 et:
