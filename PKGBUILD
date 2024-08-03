# Maintainer: Philip Goto <philip.goto@gmail.com>

pkgname=vanilla-backgrounds
pkgver=1.0.4
pkgrel=1
pkgdesc='Collection of light and dark backgrounds for Vanilla OS'
arch=(any)
url='https://github.com/Vanilla-OS/vanilla-backgrounds'
license=(CC-BY-4.0 CC-BY-SA-4.0)
depends=(webp-pixbuf-loader)
makedepends=(glib2 meson)
_commit=289090efa3ce972d1e87e896bca072424cdd9fa4
source=("https://github.com/Vanilla-OS/vanilla-backgrounds/archive/${_commit}.tar.gz")
b2sums=('d49422b76090db5b72d55fea2fb0861fa2e5ac26bfec1991a630088081da4442e95144618a19b99d8383299030153c78b352920c1564f5e26c476303c3f8393d')

build() {
	arch-meson ${pkgname}-${_commit} build
	meson compile -C build
}

check() {
	meson test -C build --print-errorlogs
}

package() {
	meson install -C build --destdir "$pkgdir"
}
