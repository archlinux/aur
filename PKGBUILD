# Maintainer: Trumpetrespas (Please comment on the package to contact me)
_pkgname=todo-or-not
pkgname=python-todo-or-not
pkgver=0.10.15
pkgrel=1
epoch=
pkgdesc="A simple tool that checks your project for TODOs and FIXMEs"
arch=(any)
url="https://github.com/Start-Out/todo-or-not"
license=('GPL3')
groups=()
depends=(python python-typer python-tqdm)
makedepends=(python-poetry)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("https://github.com/Start-Out/todo-or-not/archive/refs/tags/v${pkgver}.tar.gz")
noextract=()
sha256sums=(3abd797c8589139407ee3ec3ce9a7bda8b56210eb6ef4b8c1a6ca95894d2eedd)
validpgpkeys=()

prepare() {
	cd "$_pkgname-$pkgver"
}

build() {
	cd "$_pkgname-$pkgver"
	poetry build
}

check() {
	cd "$_pkgname-$pkgver"
}

package() {
	cd "$_pkgname-$pkgver"
	python -m installer --destdir="$pkgdir" dist/*.whl
}
