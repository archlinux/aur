# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=2.0.3
pkgrel=3
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
sha512sums=('7e3db8809dd8069ef3f0be0590a4a492b49b3f92dcf1e8cfb0e66310e6cf1d87365cf53b1eefe6c5d137282ec4b49ec3f2a185af20bf9c03153497e5bc785381')
b2sums=('ecec471e7892f41613eb30ae2203c1a5dbe2a45cc56f231ad99c9d63a39c2a41855e7f6ecf08b3beea4b73da3032363206c154bd5d8ff4b36634cd2d8c78ffcf')

 prepare() {
  sed -i "s|^Exec=.*|Exec=$pkgname|" "$pkgname.desktop"
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
