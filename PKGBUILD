# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=tacentview
pkgname=$_pkgname-bin
pkgver=1.0.40
_pkgver=1.0-40
pkgrel=2
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent (binary release)"
arch=('x86_64')
url="https://github.com/bluescan/tacentview"
license=('ISC')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/tacentview_$_pkgver.deb")
sha256sums=('2fc2099ac7ca790360bbf00c4595f3af1cee10367f42220302a475ffc83717bf')

prepare() {
  # Extract
  tar --use-compress-program=unzstd -xvf data.tar.zst
}

package() {
  # Install
  cp -r usr "$pkgdir"
  # Delete unnecessary file
  rm "$pkgdir/usr/bin/.gitignore"
}
