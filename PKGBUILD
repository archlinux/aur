# Maintainer: Boradorka

pkgname=improve-imgsli
pkgver=2.0.1
pkgrel=1
pkgdesc="Image comparison tool with magnifying glass feature"
arch=(any)
url="https://github.com/Loganavter/$pkgname"
license=(MIT)
depends=(
  hicolor-icon-theme
  python
  python-mpmath
  python-networkx
  python-numpy
  python-pillow
  python-pyqt6
  python-pyqt6-sip
  sh
)
options=(!debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz")
sha512sums=('a6e2255f0a807ad3af07eadcd4137ba68c73d37c39772ecfca2d6bae686228bb0696d1d169f518f29b4a01b4bcfdbf8f2e659d4ce0147161483e2f90906397b3')
b2sums=('8e088bf28edb5a097bac75c34f95cf114f8d0974855374071c5779a92961d29ec9977c733c22f3121ecf125b204f9433b3aabb4b743be82fd0148e2890ccc519')

prepare() {
  sed -i 's|Exec=|Exec=/usr/bin/|' Improve-ImgSLI-$pkgver/$pkgname.desktop
}

package() {
  cd Improve-ImgSLI-$pkgver
  install -vDm 755 launcher.sh                "$pkgdir"/usr/bin/$pkgname
  install -vDm 644 Improve_ImgSLI.py       -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 clickable_label.py      -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_comparison_app.py -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 image_processing.py     -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 flag_icons.py           -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 SourceSans3-Regular.ttf -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 translations.py         -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 $pkgname.desktop        -t "$pkgdir"/usr/share/applications/
  install -vDm 644 33.png                     "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -vDm 644 LICENSE.txt                "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
