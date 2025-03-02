# Maintainer Boradorka

pkgname=improve-imgsli
pkgver=1.4.2
pkgrel=4
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
sha512sums=('fc6a28f4b3aaaa5225f7696590cc0d4d01b0f08dc76a25141fcc308f3128359703000f175bf3111064464cc3e87a6f50acd8cee1a3a376a1cc975150299a0b99')
b2sums=('6284c1ca3660b8730fa551f88a28b152e2bf07c76c376f4e009ff04e63aa33e89fc890d491e16b6a191c1cb85e5a6449e916ee40e09569874117868d0711daed')

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
  install -vDm 644 translations.py         -t "$pkgdir"/usr/lib/$pkgname/
  install -vDm 644 $pkgname.desktop        -t "$pkgdir"/usr/share/applications/
  install -vDm 644 33.png                     "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -vDm 644 LICENSE.txt                "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
