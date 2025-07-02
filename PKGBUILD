# Maintainer: Kimiblock Moe

pkgname="aviator"
pkgver=0.6.0
pkgrel=1
pkgdesc="Your Video Copilot: AV1/OPUS Video Encoder"
arch=(any)
url="https://github.com/gianni-rosato/aviator"
license=("GPL-3.0-or-later")
depends=(ffmpeg gtk4 libadwaita python-ffmpeg-progress-yield python-gobject svt-av1)
makedepends=(git meson python-setuptools)
provides=("aviator")
conflicts=("aviator")
source=("git+$url.git#tag=${pkgver}")
sha512sums=('b70bdd33d7849cd7035154d2e11e501f7133d9a6569ca2846b5428a354bb268560e184ebbf057952ae3fb1a02caecada1c9c41f4dc8c59268b19772c3b260717')

function build() {
	arch-meson aviator build
	meson compile -C build
}

function package() {
	meson install -C build --destdir "$pkgdir"
}
