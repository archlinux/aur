# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.0.4
pkgrel=1
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvasrubricimporter_${pkgver}_amd64.deb")
sha256sums=('5e72d52fa376d81d4df8a83f8e0e5eedf6068692149241c1fdd7d5d9ab74ab16')

package() {
    bsdtar -xOf "$srcdir/canvasrubricimporter_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvasrubricimporter/lib/canvasrubricimporter-CanvasRubricImporter.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
