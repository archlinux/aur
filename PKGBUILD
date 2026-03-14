# Maintainer: Dinesh Jinjala
pkgname=androidmigrate
pkgver=0.1.3
pkgrel=1
pkgdesc="Checkpointed Android folder backup and sync over ADB"
arch=('any')
url="https://github.com/MachineLearning-Nerd/AndroidMigrate"
license=('MIT')
depends=('python>=3.12' 'android-tools')
makedepends=('python-build' 'python-installer' 'python-setuptools')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/MachineLearning-Nerd/AndroidMigrate/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('88e936918f637ba984f521eaf15386f27b5ec92dfcb4122c17314dec6d9a3a07')

build() {
    cd "AndroidMigrate-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    cd "AndroidMigrate-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
