# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tacentview-bin
pkgver=1.0.43
_pkgver=1.0-43
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent (binary release)"
url="https://github.com/bluescan/tacentview"
arch=('x86_64')
license=('ISC')
provides=("tacentview")
conflicts=("tacentview")
source=("$url/releases/download/v$pkgver/tacentview_$_pkgver.deb")
sha256sums=('0974df7bae147a732c5bf8b1c0d9bbefe259bbac6d9b76ad5c72956ea090fc87')

prepare() {
# Extract
  tar --use-compress-program=unzstd -xf data.tar.zst
}

package() {
# Install
  mv usr "$pkgdir"
# Delete an unnecessary file
  rm "$pkgdir/usr/bin/.gitignore"
}
