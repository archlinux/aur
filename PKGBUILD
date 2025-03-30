# Maintainer: Boradorka
# Co-maintainer: Nebulosa

pkgname=improve-imgsli
pkgver=2.0.2
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
sha512sums=('c9e02901400b45b00035aeafa691c716e257b331212c5cf848285209ed77cccb3f77680c38b1d0460916589d5ccb11fc00b3689108cccaf76a8faad882d740fb')
b2sums=('480b0a3cf0de42af4638d00229aba5b8de483840b452b76b8db7d65fd015dbcbb3b800f5c81596ff26e5262f2897d34de4e8edd0d668822272de9109870233b5')

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
