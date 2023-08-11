# Maintainer: Dan Ginovker <danielginovker@gmail.com>

pkgname=tree-game-bin
pkgver=0.11
pkgrel=1
pkgdesc="Powder toy like sandbox game focused on nature"
url="https://github.com/segfaultdev/tree"
arch=('x86_64')
license=('MIT')
depends=('libglvnd')
source=("https://github.com/segfaultdev/tree/releases/download/v${pkgver}/tree"
    	"tree-game.desktop"
    	"https://raw.githubusercontent.com/segfaultdev/tree/master/LICENSE")
sha256sums=('4e2db547e8519a3af86406e3b2b2aabff488dae2afca94bb44da41369d41c87c'
            'e1f0028d51d2a80f45fef0e552c07e09457512ecc005b669633b3536b868aebe'
            'e52bc9b76627c882c7f65113d57b8874062ac647e7a720a8b5ca7be3cad5a205')

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

