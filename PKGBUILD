# Maintainer: Caleb Maclennan <caleb@alerque.com>
# Contributor: Christopher Arndt <chris@chrisarndt.de>

pkgname=otf-bravura
pkgver=1.480
pkgrel=1
pkgdesc='An SMuFL compliant music font designed by Daniel Spreadbury at Steinberg'
arch=('any')
url='https://www.smufl.org/fonts/'
_url="https://github.com/steinbergmedia/${pkgname#otf-}"
license=('OFL')
_tag="${pkgname#otf-}-$pkgver"
_archive="${pkgname#otf-}-$_tag"
source=("$_url/archive/refs/tags/$_tag/$_archive.tar.gz")
sha256sums=('cde984e19f20131b6cac95b114cb9fc1b22c6f79ba07e166812bf5051f0cb0df')

package() {
    cd "$_archive"
    install -Dm0644 -t "$pkgdir/usr/share/fonts/OTF/" redist/otf/*.otf
    install -Dm0644 -t "$pkgdir/usr/share/licenses/$pkgname/" redist/OFL*.txt
    install -Dm0644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md redist/bravura-text.md redist/FONTLOG.txt
}
