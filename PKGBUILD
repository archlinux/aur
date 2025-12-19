# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=('msty')
pkgver=1.0.0
pkgrel=1
pkgdesc="Import canvas rubrics from csv using the api "
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvasrubricimporter_${pkgver}_amd64.deb")
sha256sums=('cd45d61bd2753507e7d97f25b24b349e178efb8e5cdeadb82c1b935180aacfa6')

package() {
    bsdtar -xOf "$srcdir/canvasrubricimporter_${pkgver}_amd64.deb" data.tar.xz | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvasrubricimporter/lib/canvasrubricimporter-CanvasRubricImporter.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
