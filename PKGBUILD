# Maintainer: Dinesh Jinjala
pkgname=androidmigrate
pkgver=0.1.2
pkgrel=1
pkgdesc="Checkpointed Android folder backup and sync over ADB"
arch=('any')
url="https://github.com/MachineLearning-Nerd/AndroidMigrate"
license=('MIT')
depends=('python>=3.12' 'android-tools')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MachineLearning-Nerd/AndroidMigrate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('cb8e5728f3d279be6df40703aca02a75c55e4e6ed9c5a7e4f93ff2badab8c41c')

build() {
    cd "AndroidMigrate-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "AndroidMigrate-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
