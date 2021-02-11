# Maintainer: kyndair <kyndair at gmail dot com>
pkgname=monkey-island-pakutils-git
_gitname=monkey
pkgver=1.0
pkgrel=1
pkgdesc="Utilities to unpack and repack Monkey Island SE paks"
arch=('i686' 'pentium4' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/timfel/monkey"
license=('unknown')
provides=('extractpak' 'packpak')
source=('git+https://github.com/timfel/monkey.git')
sha256sums=('SKIP')

build() {
    cd "$_gitname"/
    gcc extractpak.c -o extractpak
    gcc packpak.c -o packpak
}

package() {
    install -Dm755 "${srcdir}/$_gitname/extractpak" "${pkgdir}/usr/bin/extractpak"
    install -Dm755 "${srcdir}/$_gitname/packpak" "${pkgdir}/usr/bin/packpak"
    install -Dm644 "${srcdir}/$_gitname/readme.md" "${pkgdir}/usr/share/doc/${pkgname}/readme.md"
}
