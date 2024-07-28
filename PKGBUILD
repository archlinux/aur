# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakc@gmail.com>

pkgname=keym-git
pkgver=1.2
pkgrel=2
pkgdesc="C tool to control mouse with keyboard for X11 "
arch=(x86_64)
url="https://github.com/cwkx/keym"
license=('MIT')
depends=('libx11' 'libxtst')
makedepends=('gcc' 'git')
source=("git+$url")
sha256sums=('SKIP')

build() {
	cd $srcdir/keym
	gcc keym.c -lX11 -lXtst -o keym
}

package() {
	cd $srcdir/keym
	install -Dm755 keym "${pkgdir}/usr/bin/keym"
}
