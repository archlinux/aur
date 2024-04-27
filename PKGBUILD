# Maintainer: Zhou Qiankang <wszqkzqk@qq.com>

pkgname=varallel
pkgver=0.3.9
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
sha256sums=('1f7ef3770c1f5456ad5e99e6b4cb3e4bc4f63acd7abc020c3a15c07d3d0d5376')

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
