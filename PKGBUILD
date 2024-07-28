# Maintainer: Ahmet Arda Kavakcı <ahmetardakavakc@gmail.com>

pkgname=keym-git
_reponame=keym
pkgver=r40.67a6d39
pkgrel=1
pkgdesc="C tool to control mouse with keyboard for X11 "
provides=('keym')
arch=(x86_64)
url="https://github.com/cwkx/keym"
license=('MIT')
depends=('libx11' 'libxtst')
makedepends=('gcc' 'git')
source=("git+$url")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$_reponame"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$_reponame"
	gcc keym.c -lX11 -lXtst -o keym
}

package() {
    cd "$srcdir/$_reponame"
	install -Dm755 keym "${pkgdir}/usr/bin/keym"
}
