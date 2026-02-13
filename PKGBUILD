# Maintainer: Jim Madge <jim+aur@jmadge.com>
_pkgname="KnittingFontsCollection"
pkgname=ttf-stitchmastery-collection
pkgver=1.0.1
pkgrel=1
pkgdesc="Collection of 6 fonts for use in both written and charted knitting instructions"
arch=(any)
url="https://stitchmastery.com/fonts/"
license=('custom:licence.rtf')
source=(
    "KnittingFontsCollection_1.0.1.zip::https://stitchmastery.s3.amazonaws.com/KnittingFontsCollection_1.0.1.zip?AWSAccessKeyId=AKIAIYXUAHRC5END5UPQ&Expires=1771018943&Signature=3QoUykgQ8M8OcKAXlKOg6rFOiLw%3D"
)
sha256sums=(
    "a4ee411c8f9285b8f9be1070ea156e1dea9ffb1e6c6e8337a1b3c8b2415ef200"
)

_fonts=(
    StitchMasteryDash
    StitchMasteryDashCable
    StitchMasteryDashCableEH
    StitchMasteryDot
    StitchMasteryDotCable
    StitchMasteryDotCableEH
)

package() {
    cd "$_pkgname $pkgver"
    for font in "${_fonts[@]}"; do
        install -Dm644 "$font.ttf" "$pkgdir/usr/share/fonts/$pkgname/$font.ttf"
    done

    install -Dm644 "Documentation/licence.rtf" "$pkgdir/usr/share/licenses/$pkgname/licence.rtf"
}
