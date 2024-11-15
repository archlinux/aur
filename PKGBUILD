# Contributor: JannikHv <JannikHv@gmail.com>

pkgname=gamebox-git
pkgver=r23.b710d5c
pkgrel=1
pkgdesc="Collection of minigames written in C using Gtk+-3.0"
arch=('i686' 'x86_64')
url="https://github.com/JannikHv/gamebox"
license=('GPL-2.0-or-later')
depends=('gtk3')
makedepends=('git')
source=("${pkgname}"::"git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${pkgname}"
    make
}

package() {
    cd "${pkgname}"
    install -Dm 0755 gamebox "${pkgdir}/usr/bin/gamebox"
    install -Dm 0644 gamebox.desktop "${pkgdir}/usr/share/applications/gamebox.desktop"
    install -Dm 0644 LICENSE "${pkgdir}/usr/share/licenses/gamebox/LICENSE"
    install -Dm 0644 images/mill.png "${pkgdir}/usr/share/gamebox/images/mill.png"
    install -Dm 0644 images/tictactoe-preview.png "${pkgdir}/usr/share/gamebox/images/tictactoe-preview.png"
    install -Dm 0644 images/connect-four-preview.png "${pkgdir}/usr/share/gamebox/images/connect-four-preview.png"
    install -Dm 0644 images/mill-preview.png "${pkgdir}/usr/share/gamebox/images/mill-preview.png"
    install -Dm 0644 images/checkers-preview.png "${pkgdir}/usr/share/gamebox/images/checkers-preview.png"
    install -Dm 0644 images/checkers.png "${pkgdir}/usr/share/gamebox/images/checkers.png"
}
