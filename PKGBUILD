# Maintainer: Boradorka

pkgname=improve-imgsli
pkgver=2.0.0
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
sha512sums=('40ab58cf59aae0bba21e0cd3f39814eb367423353d793350d17e3e309291182ca16f9fad38433046517ead8d3111d7346e450b6a6587246f1b1e3f2723e6b834')
b2sums=('e32c53ada2d2fab6db7bd578a4771b851182598514a08e3a5cd10b23c3e53902b540e68febce68c7ec5e214fc657bf60f85026b85f43d166eb199cb28dbe533a')

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
