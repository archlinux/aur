# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname='shijima-qt-bin'
__pkgname="shijima"
_pkgname="Shijima-Qt-x86_64.AppImage"
provides=(shijima-qt)
conflicts=(shijima-qt)
options=(!strip)
pkgver='0.0.2'
pkgrel='2'
pkgdesc='Cross-platform shimeji simulation Desktop pets on any device.'
arch=('x86_64')
license=('GPL')
url='https://github.com/pixelomer/Shijima-Qt'
sha256sums=('5e130677625fa346d7204e9bc1d774432168f5bf19138999b52745c72c9c540e')
depends=(
  'qt6-base'
  'fuse2'
  'fuse-common'
  'qt6-multimedia'
)
source=("https://github.com/pixelomer/Shijima-Qt/releases/download/v"${pkgver}"/release-linux-x86_64.zip")
prepare () {
    cd "$srcdir"
    chmod +x $_pkgname
    ./$_pkgname --appimage-extract
}

package() {
  cd "$srcdir"
  install -Dm755 $_pkgname "$pkgdir/opt/$__pkgname/$_pkgname"
  install -dm755 "$pkgdir/usr/bin"
   ln -s "/opt/$__pkgname/$_pkgname" "$pkgdir/usr/bin/$__pkgname"
}
