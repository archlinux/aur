# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

_pkgname=tacentview
pkgname=$_pkgname-bin
pkgver=1.0.42
_pkgver=1.0-42
pkgrel=1
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent (binary release)"
arch=('x86_64')
url="https://github.com/bluescan/tacentview"
license=('ISC')
conflicts=($_pkgname)
provides=($_pkgname)
source=("$_pkgname-$pkgver.deb::$url/releases/download/v$pkgver/tacentview_$_pkgver.deb")
sha256sums=('2dcd4991a444fac3457364cdd67475fdac6d1718ff6048facfe3512f05a0d4cc')

prepare() {
  # Extract
  tar --use-compress-program=unzstd -xf data.tar.zst
}

package() {
  # Install
  mv usr "$pkgdir"
  # Delete unnecessary file
  rm "$pkgdir/usr/bin/.gitignore"
}
