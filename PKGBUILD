# Maintainer: Alex Averyanov <averyanalex@gmail.com>
pkgname=fractalman-git
pkgver=r18.1f7f874
pkgrel=1
pkgdesc="Python tool to generate fractals"
arch=('any')
url="https://github.com/Vitmalok/FractalMan"
license=('MIT')
depends=('python' 'tk')
makedepends=('git' 'binutils' 'pkgconf')
conflicts=('fractalman')
provides=('fractalman')
source=("FractalMan::git+https://github.com/Vitmalok/FractalMan.git")
sha256sums=('SKIP')
pkgver() {
    cd FractalMan
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    cd "$srcdir/FractalMan"
    install -Dm755 main.py "$pkgdir"/usr/bin/fractalman
    install -Dm644 icon.png "$pkgdir"/usr/share/pixmaps/fractalman.png
    install -Dm644 fractalman.desktop "$pkgdir"/usr/share/applications/fractalman.desktop
}
