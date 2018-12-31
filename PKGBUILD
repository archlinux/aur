# Maintainer: Chris Mustola <chris.mustola at gmail dot com>

pkgname=touchpad_config
pkgbase="$pkgname-git"
pkgver=1.0
pkgrel=1
pkgdesc="A simple tool that uses xinput to enable Tap to click and natural scrolling on a touchpad"
arch=('x86_64')
license=('GPL3')
depends=('xorg-xinput')
makedepends=('git')
provides=('touchpad_config')
url="https://gitlab.com/Bettehem/touchpad_config"
source=("touchpad_config::git+https://gitlab.com/Bettehem/touchpad_config.git")
md5sums=('SKIP')


build() {
	cd "$srcdir/$pkgname"
	make
}

package() {
	cd "$srcdir/$pkgname"
	make PREFIX="/usr" DESTDIR="$pkgdir" install
}
