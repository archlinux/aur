#!/bin/bash
# shellcheck disable=SC2034
# Maintainer: Alexandre Bouvier <contact at amb dot tf>
pkgname=vlc-sd-freebox
pkgver=2.0.5
pkgrel=1
pkgdesc="Freebox TV service discovery"
arch=('i686' 'x86_64')
url="https://addons.videolan.org/p/1153978/"
license=('GPL')
depends=('vlc')
source=("https://raw.githubusercontent.com/videolan/vlc/ac17dc8ac38f72aa8b01dfe9df011da2b2ba7479/share/lua/sd/freebox.lua")
md5sums=('943db79f61ae7d5fb64c15d319a852e8')

build() {
	luac -o freebox.lua{c,}
}

package() {
	# shellcheck disable=SC2154
	install -Dm644 -t "$pkgdir/usr/lib/vlc/lua/sd" freebox.luac
}
