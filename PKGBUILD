# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tacentview-bin
pkgver=1.0.43
_pkgver=1.0-43
pkgrel=2
pkgdesc="An image and texture viewer for tga, png, apng, exr, dds, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files. Uses Dear ImGui, OpenGL and Tacent (binary release)"
url="https://github.com/bluescan/tacentview"
license=('ISC')
arch=('x86_64')
depends=('libx11' 'hicolor-icon-theme' 'libxcb')
provides=("tacentview")
conflicts=("tacentview")
source=("$url/releases/download/v$pkgver/tacentview_$_pkgver.deb"
        "$url/raw/master/LICENSE")
sha256sums=('0974df7bae147a732c5bf8b1c0d9bbefe259bbac6d9b76ad5c72956ea090fc87'
            'SKIP')

prepare() {
  tar --use-compress-program=unzstd -xf data.tar.zst
  cd usr
  rm bin/.gitignore share/tacentview/Data/.gitignore
}

package() {
  mv usr "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
