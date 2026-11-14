# Maintainer: Scalpel <scalpelpoe at gmail dot com>
# Contributor: Kristofers Solo <dev at kristofers dot xyz>

pkgname=scalpel-poe-bin
pkgver=1.0.6
pkgrel=1
pkgdesc="Path of Exile's First Fourth-Party Tool"
arch=("x86_64")
url="https://github.com/scalpelpoe/scalpel"
license=("AGPL-3.0-only")
options=(!strip)
depends=(
    "fuse2"
)
provides=("scalpel-poe")
conflicts=("scalpel-poe" "scalpel-poe-git")
_upstream_version="${pkgver/_/-}"
source=(
    "$pkgname-$_upstream_version.AppImage::$url/releases/download/v$_upstream_version/Scalpel.AppImage"
    "$pkgname-$_upstream_version.png::$url/raw/v$_upstream_version/resources/icon.png"
    "$pkgname-$_upstream_version-LICENSE::$url/raw/v$_upstream_version/LICENSE"
    "scalpel-poe.sh"
    "scalpel-poe.desktop"
)
noextract=("$pkgname-$_upstream_version.AppImage")
sha256sums=('61f0af582af039609899c5c612b6a5785fd0368384b19aa0ef4bed8eca503d54'
            '31db68f35fdeb9f2d8ad1fdf87784c4e590a8d715a18972a58e5870b160fd92e'
            '0d96a4ff68ad6d4b6f1f30f713b18d5184912ba8dd389f86aa7710db079abcb0'
            'aec6807cc11a1f0f172577d5d24744d457c2d52fd51c4b92d1e6b8bfbb943b1f'
            'be4904493f9322e59649768c209eeeed71ebf8f4f92321614967f749807794dc')

package() {
    install -Dm755 "$srcdir/$pkgname-$_upstream_version.AppImage" "$pkgdir/opt/scalpel-poe/Scalpel.AppImage"

    install -Dm755 "$srcdir/scalpel-poe.sh" "$pkgdir/usr/bin/scalpel-poe"
    install -Dm644 "$srcdir/scalpel-poe.desktop" "$pkgdir/usr/share/applications/scalpel-poe.desktop"
    install -Dm644 "$srcdir/$pkgname-$_upstream_version.png" "$pkgdir/usr/share/pixmaps/scalpel-poe.png"
    install -Dm644 "$srcdir/$pkgname-$_upstream_version-LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
