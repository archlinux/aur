#$Id: PKGBUILD 186840 2016-08-16 06:41:15Z eworm $ 
# Maintainer: Daniel Wallace <danielwallace at gtmanfred dot com>
# Contributor: portix <portix at gmx.net>

pkgname=dwb
_commit=f9e861e
pkgver=2014.03.07.r135.g${_commit}
pkgrel=1
pkgdesc='A webkit web browser with vi-like keyboard shortcuts'
url='http://portix.bitbucket.org/dwb/'
arch=('i686' 'x86_64')
install=dwb.install
license=('GPL')
depends=('webkitgtk2' 'desktop-file-utils')
makedepends=('git' 'json-c')
source=("git+https://bitbucket.org/portix/dwb.git#commit=${_commit}")
sha256sums=('SKIP')

build() {
	cd "${srcdir}/dwb/"

	make
}

package() {
	cd "${srcdir}/dwb/"

	export BASHCOMPLETION=/usr/share/bash-completion/completions
	make DESTDIR="${pkgdir}" install
}
