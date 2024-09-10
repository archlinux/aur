# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=tacentview-bin
pkgver=1.0.46
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Image viewer/editor for tga, png, apng, exr, dds, pvr, ktx, ktx2, astc, pkm, qoi, gif, hdr, jpg, tif, ico, webp, and bmp files (binary release)"
url="https://github.com/bluescan/tacentview"
license=('ISC')
arch=('x86_64')
depends=('hicolor-icon-theme' 'libx11' 'libxcb')
provides=("tacentview")
conflicts=("tacentview")
source=("$url/releases/download/v$pkgver/tacentview_$_pkgver.deb"
        "$url/raw/43f3dbbe06d14736fd8a4673fa30703402777089/LICENSE")
sha256sums=('5857d5ce768f87015e8b0d4e83a1bbc38da50ae1817289df9d6929ed0c76bfb6'
            'c451a16bd0f04374bceadd5080319d81c2de554c0a8d6a9ca139b3f0fb2b26a4')

package() {
  tar --use-compress-program=unzstd -xf data.tar.zst -C "$pkgdir"
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/tacentview"
}
