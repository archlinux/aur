# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=tacentview
pkgname=$_pkgname-bin
pkgver=1.0.39
_pkgver=1.0-39
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent (binary release)"
arch=('x86_64')
url="https://github.com/bluescan/tacentview"
license=('ISC')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/tacentview_$_pkgver.deb")
sha256sums=('05375e0400371ebf34974abc98936f1fcde5d79889eada49871cdfa5cd04c628')

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
