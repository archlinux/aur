# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.1.2
pkgrel=1
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvasrubricimporter_${pkgver}_amd64.deb")
sha256sums=('a2f5d792b7a1e6f4eeef90b9f8367d3239333c543458cc1c2f64fd1908419fe8')

package() {
    bsdtar -xOf "$srcdir/canvasrubricimporter_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvasrubricimporter/lib/canvasrubricimporter-CanvasRubricImporter.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
