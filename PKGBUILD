# Maintainer: aksr <aksr at t-com dot me>
pkgname=ttf-new-athena-unicode
_pkgname=NAU
pkgver=5.005
pkgrel=1
pkgdesc="A freeware multilingual font distributed by the American Philological Association."
arch=(any)
license=('OFL')
url="https://apagreekkeys.org/NAUdownload.html"
depends=('fontconfig' 'xorg-font-utils')
source=("https://apagreekkeys.org/fonts/${_pkgname}${pkgver/\./_}.zip")
install=ttf.install
md5sums=('d78053572a5ae101e1c4d3b99b49d276')
sha1sums=('97da1449b868ffcd0b53019f27389af1a51ffc95')
sha256sums=('5c8f7bfdceca6296e2fe9d7499a4736bf6c494466c1941968a60e75b01a1f695')

package() {
  cd $srcdir/${_pkgname}${pkgver/\./_}
  for i in *.ttf; do
    install -Dm644 $i $pkgdir/usr/share/fonts/TTF/$i
  done
  install -Dm644 AboutNAUfont_v5_005.rtf $pkgdir/usr/share/doc/$pkgname/AboutNAUfont_v5_005.rtf
  install -Dm644 NAU5_OpenFontLicense.pdf $pkgdir/usr/share/licenses/$pkgname/NAU5_OpenFontLicense.pdf
}

