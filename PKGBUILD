# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.2.5
pkgrel=1
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvasrubricimporter_${pkgver}_amd64.deb")
sha256sums=('f71a70e15e0b229a2ca01c14c62ff8af56efb7c24db0d2724385fb8cba38df1f')

package() {
    bsdtar -xOf "$srcdir/canvasrubricimporter_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvasrubricimporter/lib/canvasrubricimporter-CanvasRubricImporter.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
