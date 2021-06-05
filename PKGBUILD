# Maintainer: Yufan You <ouuansteve at gmail>
# Contributor: Coelacanthus <liuhongwu2003@outlook.com>

pkgname=guide-bin
pkgver=1.0.2
pkgrel=6
pkgdesc='由北航 GAIT 研究组开发的、专门为 NOI 选手设计的轻型集成开发环境'
arch=('i686' 'x86_64')
url='http://www.noi.cn/xw/2009-03-23/714714.shtml'
license=('custom')
depends=(
  'hicolor-icon-theme'
  'lib32-libpng12'
  'lib32-libsm'
  'lib32-libice'
  'lib32-libxi'
  'lib32-libxrender'
  'lib32-libxrandr'
  'lib32-freetype2'
  'lib32-fontconfig'
  'lib32-libxext'
  'lib32-libx11'
  'lib32-zlib'
  'lib32-glib2'
  'lib32-glibc'
  'lib32-gcc-libs'
)
optdepends=(
  'gdb: Debug C++'
  'fpc: Pascal'
)
source=(
  "http://download.noi.cn/T/noi/GUIDE-${pkgver}-ubuntu.tar"
  'GUIDE.desktop'
)
sha256sums=('263af8b4710408f08c772edf065dd9d41e287f8bbd3e57054fdb5b612c6f3086'
            '121f3e0eebc4bfa911fefa55025ed4d6a74a183b225dee8801361e6873e24859')

package() {
  cd "$srcdir/GUIDE-${pkgver}-ubuntu"
  install -Dm644 doc/*.* -t "$pkgdir"/usr/share/doc/GUIDE/html/
  install -Dm644 doc/images/*.* -t "$pkgdir"/usr/share/doc/GUIDE/html/images/
  install -Dm644 lang_en.qm -t "$pkgdir"/usr/share/
  install -Dm644 apis/* -t "$pkgdir"/usr/share/apis/
  install -Dm644 doc/images/Manna.png "$pkgdir"/usr/share/icons/hicolor/128x128/apps/GUIDE.png
  install -Dm755 GUIDE -t "$pkgdir"/usr/bin/
  cd ..
  install -Dm644 GUIDE.desktop -t "$pkgdir"/usr/share/applications
}
