# Maintainer: AvianaCruz <gwencroft <at> proton <dot> me>
# Contributor: Rowisi < nomail <at> private <dot> com >
# Contributor: So1ar <so1ar114514 <at> gmail <dot> com>

pkgname=hmcl-new
_ver=3.5.3
_build=223
pkgver=$_ver.$_build
pkgrel=1
pkgdesc='An unofficial build of HMCL that trying to compile and run HMCL with the latest LTS version of java.'
arch=('any')
url='https://github.com/skbeh/HMCL-build'
license=('GPL3')
depends=('java-openjfx>=17')
provides=('hmcl')
conflicts=('hmcl')
source=('hmcl.desktop'
  'hmcl-launch-script'
  'craft_table.png'
  'LICENSE::https://raw.githubusercontent.com/huanghongxun/HMCL/javafx/LICENSE'
  "$pkgname-$pkgver-$pkgrel.jar::$url/releases/download/v$pkgver/HMCL-$pkgver.jar")
sha256sums=('b4e8aa0f349bb3f5dd15a31c5a13ac3e10e5a5bcd2f97cf390041924275e43ef'
  '534e391a637394e47cdeb0d9dfe24cd6fd1dedb863c085951403ec24f1470d06'
  '2989a1b5301b8c7b9afdae5696c6a4e5246afa2d4f1f3d3dad5c192f036a9b4c'
  '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
  'd3680eb1f126f1d9cc2239bf68387165ce2d91b3cc9cd510a8339dddb68fb94d')
noextract=("$pkgname-$pkgver-$pkgrel.jar")

package() {
  install -Dm755 'hmcl-launch-script' "$pkgdir/usr/bin/$pkgname"
  install -Dm644 'hmcl.desktop' "$pkgdir/usr/share/applications/$pkgname.desktop"
  install -Dm644 "$pkgname-$pkgver-$pkgrel.jar" "$pkgdir/usr/share/java/$pkgname/$pkgname.jar"
  install -Dm644 'craft_table.png' "$pkgdir/usr/share/icons/hicolor/48x48/apps/$pkgname.png"
  install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
