# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=varallel
pkgver=0.3.7
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
sha256sums=('3c1d2dfc312d80599312b8c2462a8a521abf16069ae2389da8c1e529c0991e79')

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
