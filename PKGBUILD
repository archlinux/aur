# Maintainer: Lucas Puntillo <laniku@envs.net>

pkgname=tree-game
pkgver=0.10
pkgrel=1
pkgdesc="Powder toy like sandbox game focused on nature"
url="https://github.com/segfaultdev/tree"
arch=('x86_64')
license=('MIT')
depends=('libglvnd')
source=(
  "https://github.com/segfaultdev/tree/archive/refs/tags/v0.10.tar.gz"
  tree-game.desktop
  "https://raw.githubusercontent.com/segfaultdev/tree/master/LICENSE"
)
sha256sums=(
  'f5cebb2502874b3a1137b48855ea25ebd6dda8c7d8905cb7c948c5627a907167'
  '9c6638d0971105517fbb244d7c00220fb34786597d6107fb6172b11008a1a018'
  '78f3201cff6e5a760db10ce3d7456f0f0a9c130fe132095d90f3eb16cb6296ea'
)

build() {
    bash build_quick.sh
}

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
