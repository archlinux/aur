# Maintainer: Eric Zhao <21zhaoe@protonmail.com>
pkgbase=otf-noto-sans-cuneiform
pkgname=otf-noto-sans-cuneiform
pkgver=2.001
pkgrel=1
pkgdesc='Noto Cuneiform fonts'
provides=(noto-fonts-cuneiform)
arch=(any)
url='https://fonts.google.com/noto/use'
license=('OFL-1.1')
source=(https://github.com/notofonts/cuneiform/releases/download/NotoSansCuneiform-v${pkgver}/NotoSansCuneiform-v${pkgver}.zip)
noextract=(NotoSansCuneiform-v${pkgver}.zip)
sha256sums=('b686250dd8ab4defa9900236bb6e31f1f6fbe9e3c3b70e777272cec1cd26bd27')

prepare() {
  bsdtar -xvf NotoSansCuneiform-v${pkgver}.zip --strip-components 1
}

package_otf-noto-sans-cuneiform() {
  pkgdesc+=' (Sans, Static OTC)'
  install -Dm644 full/otf/NotoSansCuneiform-Regular.otf -t "$pkgdir"/usr/share/fonts/noto-cuneiform
  install -Dm644 OFL.txt -t "$pkgdir"/usr/share/licenses/$pkgname
}
