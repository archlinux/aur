# Maintainer: Magillos <kerown at gmail com>
pkgname=jack_delay-gui
pkgver=0.1.0
pkgrel=2
pkgdesc="GUI for jack_delay"
arch=('any')
url="https://github.com/magillos/jack_delay-GUI"
license=('GPL3')
depends=('python-pyqt6' 'python-jack-client' 'jack_delay')
source=(
  "https://raw.githubusercontent.com/magillos/jack_delay-GUI/main/LICENSE"
  "https://raw.githubusercontent.com/magillos/jack_delay-GUI/main/latency_test.py"
  "https://raw.githubusercontent.com/magillos/jack_delay-GUI/main/com.example.latency.desktop"
  "https://raw.githubusercontent.com/magillos/jack_delay-GUI/main/Latency_test.svg"
  "https://raw.githubusercontent.com/magillos/jack_delay-GUI/main/setup.py"
)
md5sums=('1ebbd3e34237af26da5dc08a4e440464'
         'b1714284a55eaeb4ccf75160f90461ec'
         '88fb1564c06e37d0f7e639fe940b9bbb'
         '67e5999db0ac7154c996aacbc0c7d0d9'
         'ca975d4a2b3c26e93433b4fda8002173')

build() {
  cd "$srcdir"
  python setup.py build
}

package() {
  cd "$srcdir"
  python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 "Latency_test.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/Latency_test.svg"
  install -Dm644 "com.example.latency.desktop" "$pkgdir/usr/share/applications/com.example.latency.desktop"

}
