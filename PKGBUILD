# Maintainer: Stephen Brown II <Stephen [dot] Brown2 [at] gmail.com>
_pkgbase=xkcd-font
pkgname=('otf-xkcd-font' 'ttf-xkcd-script-font')
pkgver=r39.5632fde
pkgrel=1
pkgdesc="The xkcd font."
arch=(any)
url="https://github.com/ipython/xkcd-font"
license=('CCPL:cc-by-nc')
depends=('fontconfig' 'xorg-font-utils')
source=($_pkgbase::git+https://github.com/ipython/xkcd-font.git)
md5sums=(SKIP)
pkgver() {
  cd "$_pkgbase"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
package_otf-xkcd-font() {
  install=otf.install
  cd "$srcdir"
  install -Dm644 "${_pkgbase}/xkcd/build/xkcd.otf" "$pkgdir/usr/share/fonts/OTF/xkcd.otf"
  install -Dm644 "${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
package_ttf-xkcd-script-font() {
  install=ttf.install
  cd "$srcdir"
  install -Dm644 "${_pkgbase}/xkcd-script/font/xkcd-script.ttf" "$pkgdir/usr/share/fonts/TTF/xkcd-script.ttf"
  install -Dm644 "${_pkgbase}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
