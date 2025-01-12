# Maintainer: Yakov Till <yakov.till at gmail dot com>

pkgname=sigil2-wad
pkgver=1.0
pkgrel=1

url="https://romero.com/sigil"
pkgdesc="SIGIL II, the unofficial 6th episode of the original 1993 DOOM by John Romero. Requires DOOM.WAD"
license=('custom')

arch=('any')
makedepends=('unzip')
source=("https://romero.com/s/SIGIL_II_V1_0.zip"
        "https://images.squarespace-cdn.com/content/v1/5fef3318f8ce9b562500206e/c05bd3cb-30a4-4d20-8dd9-8411a22d8be8/Romero_Logo_Sigil2+red+metal+hi-res.png"
        "sigil2.desktop")

sha256sums=('41741ce797e6faf9ebd0e3d577b5eaf9a648b64d850fbd741c1b9c28d8461017'
            '595e182f0ef0266d349402a615ad39723cd620e834f34183bd456f4cd3380d9b'
            '35a3a026b4c2e6d55797b6d0f5b4d44ded6f4b27a3f3b94be3560a716a5d5231')

package() {
    cd "$srcdir"
    
    mkdir -p "$pkgdir/usr/share/doom"
    mkdir -p "$pkgdir/usr/share/doc/$pkgname"
    mkdir -p "$pkgdir/usr/share/licenses/$pkgname"
    mkdir -p "$pkgdir/usr/share/games/sigil2"
    
    install -Dm644 "SIGIL_II_README_V1_0.txt" "$pkgdir/usr/share/doc/$pkgname/README.txt"
    install -Dm644 "SIGIL_II_V1_0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
    install -Dm644 "SIGIL_II_V1_0.WAD" "$pkgdir/usr/share/games/sigil2/sigil2.wad"
    ln -s /usr/share/games/sigil2/sigil2.wad "$pkgdir/usr/share/doom/sigil2.wad"

    install -Dm644 "Romero_Logo_Sigil2+red+metal+hi-res.png" "$pkgdir/usr/share/pixmaps/sigil2.png"
    install -Dm644 "sigil2.desktop" "$pkgdir/usr/share/applications/sigil2.desktop"
}
