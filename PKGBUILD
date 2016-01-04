# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
pkgname=otf-xkcd-font
pkgver=r18.d092014
pkgrel=1
pkgdesc="The xkcd font."
arch=(any)
url="https://github.com/ipython/xkcd-font"
license=('CCPL:cc-by-nc')
depends=('fontconfig' 'xorg-font-utils')
install=otf.install
source=($pkgname::git+https://github.com/ipython/xkcd-font.git)
md5sums=(SKIP)
pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package() {
  cd "$srcdir"
  install -Dm644 $pkgname/build/xkcd.otf "$pkgdir/usr/share/fonts/OTF/xkcd.otf"
  install -Dm644 $pkgname/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}