# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=tree-game-bin
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
    'e1f0028d51d2a80f45fef0e552c07e09457512ecc005b669633b3536b868aebe'
    '78f3201cff6e5a760db10ce3d7456f0f0a9c130fe132095d90f3eb16cb6296ea')

package() {
    # Copy executable and make it runnable
    install -D -m755 \
        "${srcdir}/tree" \
        "${pkgdir}/usr/bin/${pkgname}"
    

    # Desktop Environment integration
    install -D -m644 \
        "${srcdir}/tree-game.desktop" \
        "${pkgdir}/usr/share/applications/tree-game-bin.desktop"

    # License
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

