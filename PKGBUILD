# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.0.2
pkgrel=1
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvasrubricimporter_${pkgver}_amd64.deb")
sha256sums=('4af9bdf2c22a071e050c96a0d8469931794085ab157b37e52b3033485258132b')

package() {
    bsdtar -xOf "$srcdir/canvasrubricimporter_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvasrubricimporter/lib/canvasrubricimporter-CanvasRubricImporter.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
