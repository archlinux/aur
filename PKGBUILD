# Maintainer: Kimiblock Moe

pkgname=python-minecraft-model-reader
pkgdesc=""
license=(custom)
arch=(any)
pkgver=1.4.0
pkgrel=1
makedepends=(python-build python-installer python-wheel)
depends=(python)
source=(
	"model-reader-${pkgver}"::"https://github.com/gentlegiantJGC/Minecraft-Model-Reader/archive/refs/tags/${pkgver}.tar.gz"
)
md5sums=(
	"SKIP"
)

function build() {
	cd "${srcdir}/Minecraft-Model-Reader-${pkgver}"
	python -m build --wheel --no-isolation
}

function package() {
	cd "${srcdir}/Minecraft-Model-Reader-${pkgver}"
	python -m installer --destdir="${pkgdir}" dist/*.whl
}

