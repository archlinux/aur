# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.0.10
pkgrel=2
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvas-rubric-importer_${pkgver}_amd64.deb")
sha256sums=('2f137630d094239243152f4ef05ba3fba9e30707c4c3d69e13d4023d7b85f8d4')

package() {
    bsdtar -xOf "$srcdir/canvas-rubric-importer_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvas-rubric-importer/lib/canvas-rubric-importer-Canvas_Rubric_Importer.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
