# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgbase=tree-game-bin
pkgname=tree-game
pkgver=0.09
pkgrel=1
pkgdesc="Powder toy like sandbox game focused on nature"
url="https://github.com/segfaultdev/tree"
arch=('x86_64')
license=('MIT')
depends=('libglvnd')
source=("https://github.com/segfaultdev/tree/releases/download/v0.09/tree"
    tree-game.desktop
    "https://raw.githubusercontent.com/segfaultdev/tree/master/LICENSE")
sha256sums=('84dd3f206b4eefaf01c6571b8a165569907cb845326ebd69a48bfc6728ec33d7'
    '9c6638d0971105517fbb244d7c00220fb34786597d6107fb6172b11008a1a018'
    '78f3201cff6e5a760db10ce3d7456f0f0a9c130fe132095d90f3eb16cb6296ea')

package() {
    # Copy executable and make it runnable
    install -D -m755 \
        "${srcdir}/tree" \
        "${pkgdir}/usr/bin/${pkgname}"
    

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/tree-game.desktop" \
        "${pkgdir}/usr/share/applications/tree-game.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

