# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakc@gmail.com>

pkgname=xcorners-git
_reponame=xcorners
pkgver=r16.2763402
pkgrel=1
pkgdesc="A small utility for drawing rounded screen corners on X11 "
provides=('xcorners')
arch=(x86_64)
url="https://github.com/Spydr06/xcorners"
license=('MIT')
depends=('libx11' 'libxfixes' 'cairo')
makedepends=('gcc' 'make')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_reponame"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_reponame"
	make
}

package() {
  cd "$srcdir/$_reponame"
	install -Dm755 xcorners "${pkgdir}/usr/bin/xcorners"
}
