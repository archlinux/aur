# Maintainer: Eslam Allam eslamallam73@gmail.com
pkgname=canvas-rubric-importer
conflicts=()
pkgver=1.1.0
pkgrel=2
pkgdesc="Import canvas rubrics from csv using the api"
arch=('x86_64')
url="https://github.com/eslam-allam/canvas-rubric-importer"
license=('MIT')   # Change as needed
depends=()          # List dependencies
source=("https://github.com/eslam-allam/canvas-rubric-importer/releases/download/v${pkgver}/canvas-rubric-importer_${pkgver}_amd64.deb")
sha256sums=('ea164f50c1e8cb14ffba9b66a2812cd6dba575718acaea53ec145963b88d5f52')

package() {
    bsdtar -xOf "$srcdir/canvas-rubric-importer_${pkgver}_amd64.deb" data.tar.zst | bsdtar -C "$pkgdir" -xv
    install -Dm644 "$pkgdir/opt/canvas-rubric-importer/lib/canvas-rubric-importer-Canvas_Rubric_Importer.desktop" "$pkgdir/usr/share/applications/canvasrubricimporter.desktop"
}
