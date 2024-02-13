# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tacentview-bin
pkgver=1.0.43
_pkgver=1.0-43
pkgrel=3
pkgdesc="Image viewer/editor for tga, png, apng, exr, dds, pvr, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files (binary release)"
url="https://github.com/bluescan/tacentview"
license=('ISC')
arch=('x86_64')
depends=('hicolor-icon-theme' 'libx11' 'libxcb')
provides=("tacentview")
conflicts=("tacentview")
source=("$url/releases/download/v$pkgver/tacentview_$_pkgver.deb"
        "$url/raw/master/LICENSE")
sha256sums=('0974df7bae147a732c5bf8b1c0d9bbefe259bbac6d9b76ad5c72956ea090fc87'
            'SKIP')

prepare() {
  tar --use-compress-program=unzstd -xf data.tar.zst
  rm usr/bin/.gitignore usr/share/tacentview/Data/.gitignore
}

package() {
  mv usr "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
