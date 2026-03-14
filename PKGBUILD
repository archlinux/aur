# Maintainer: Dinesh Jinjala
pkgname=androidmigrate
pkgver=0.1.0
pkgrel=1
pkgdesc="Checkpointed Android folder backup and sync over ADB"
arch=('any')
url="https://github.com/MachineLearning-Nerd/AndroidMigrate"
license=('MIT')
depends=('python>=3.12' 'android-tools')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MachineLearning-Nerd/AndroidMigrate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('SKIP')

build() {
    cd "AndroidMigrate-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "AndroidMigrate-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
