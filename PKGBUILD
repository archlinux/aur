# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=varallel
pkgver=0.3.2
pkgrel=1
pkgdesc="A cross-platform and easy to use CLI tool to run commands in parallel"
url="https://github.com/wszqkzqk/varallel"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(glib2)
makedepends=(
    vala
    meson
)
source=("git+https://github.com/wszqkzqk/varallel.git#tag=${pkgver}")
sha256sums=('ce0c812a04b39467b8ab458ea2a27b2c98676832476c69b22a1f52ca8614e0b8')

build() {
    arch-meson "${pkgname}" build
	meson compile -C build
}

check() {
	meson test -C build
}

package() {
	meson install -C build --destdir "${pkgdir}"
}
