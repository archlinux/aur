# Maintainer: Trumpetrespas <email [at] trumpetrespas [dot] com>
_pkgname=todo-or-not
pkgname=python-todo-or-not
pkgver=0.14.7
pkgrel=3
epoch=
pkgdesc="A simple tool that checks your project for TODOs and FIXMEs"
arch=(any)
url="https://github.com/Start-Out/todo-or-not"
license=('GPL3')
groups=()
depends=(python python-typer python-tqdm python-ply)
makedepends=(python-build)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Start-Out/todo-or-not/archive/refs/tags/v${pkgver}.tar.gz"
	"0001-Fixed-cli-issue.patch")
noextract=()
sha256sums=('61e4030c547f28c5561084e8933e5b7e002109a0a1f06c92d004b3da84da3cdd'
            'e520f43da5236233062e8b79e219ebd2dc18cf2fc9999a11d1bd481d53209894')
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
	patch -Np1 -i ../0001-Fixed-cli-issue.patch
}

build() {
	cd "$_pkgname-$pkgver"
	python -m build
}

check() {
	cd "$_pkgname-$pkgver"
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
