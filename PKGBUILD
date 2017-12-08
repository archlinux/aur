# $Id$
# Maintainer: Tjahneee <t3e@protonmail.com>

pkgname=tic-80
pkgver=0.50.1
pkgrel=2
pkgdesc='TIC-80 tiny computer emulator'
arch=('i686' 'x86_64')
url="https://tic.computer/"
license=('MIT')

source=("https://github.com/nesbox/TIC-80/archive/v$pkgver.tar.gz")

sha256sums=('afb222c55fc4eb82c5c9d3c82807fb6dcf3f7d75d50ae4d930a23eed0f343d1e')

package() {
	cd TIC-80-$pkgver/
	rm -f lib/linux*/*
	make linux
	install -Dm755 bin/tic80 "${pkgdir}/usr/bin/tic80"
}
