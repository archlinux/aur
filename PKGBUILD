# Maintainer: begin-theadventure <begin-thecontact.ncncb at dralias dot com>

pkgname=slos-gimpainter
pkgver=20250702
_commit=b28d9dce2e913cdd6b7e2b895ecd9f97c9372dee
pkgrel=1
arch=('any')
pkgdesc='A brush package for GIMP 2.10.20 or later'
url="https://github.com/SenlinOS/SLOS-GIMPainter"
license=('MIT')
depends=('gimp')
source=("$pkgver.zip::https://github.com/SenlinOS/SLOS-GIMPainter/archive/$_commit.zip")
sha256sums=('dc4ce8d6a266ae7d29ea6c18bcf3978b9df5d26b62d2cdc6610e9d20986c16a1')

package() {
  dir=usr/share/gimp/3.0
  mkdir -p "$pkgdir/${dir}"
  cd SLOS-GIMPainter-$_commit
  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
  mv {brushes,dynamics,tool-presets} "$pkgdir/${dir}"
}
