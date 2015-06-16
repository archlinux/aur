pkgname=prime-gpuchooser
pkgver=r5.f13bea7
pkgrel=1
pkgdesc="A graphical tool to choose the GPU used for 3D rendering with PRIME. Requires dri3."
arch=('any')
url="https://github.com/ChristophHaag/gpuchooser"
license=('GPL')
depends=('python-pyqt5' 'mesa-demos')
source=("git+https://github.com/ChristophHaag/gpuchooser.git")
md5sums=("SKIP")

#prepare() {
#  cd $srcdir/gpuchooser
#}

pkgver() {
  cd gpuchooser
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


package() {
  cd "$srcdir/gpuchooser"
  install -Dm644 gpuchooser.py "$pkgdir/usr/lib/gpuchooser/gpuchooser.py"
  install -Dm644 ui_gpuchooser.py "$pkgdir/usr/lib/gpuchooser/ui_gpuchooser.py"
  install -Dm755 gpuchooser "$pkgdir/usr/bin/gpuchooser"
  install -Dm644 gpuchooser.desktop "$pkgdir/usr/share/applications/gpuchooser.desktop"
}
