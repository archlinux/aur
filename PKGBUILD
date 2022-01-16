# Maintainer: Kaizhao Zhang <zhangkaizhao@gmail.com>
# Maintainer: mochaaP <aur@mochaa.ws>

_pkgname=kose-font
pkgname=ttf-${_pkgname%-font}-git
pkgver=3.11.r129.g0d24786
pkgrel=3
pkgdesc="A Chinese Font derived from SetoFont / Naikai Font / cjkFonts-AllSeto"
arch=('any')
license=('OFL')
url="https://github.com/lxgw/${_pkgname}"
source=("git+${url}.git")
sha256sums=('SKIP')

package() {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 TTF\ \(Simplified\ Chinese\)/XiaolaiSC-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/XiaolaiSC-Regular.ttf"
  install -Dm644 TTF\ \(Simplified\ Chinese\)/XiaolaiMonoSC-Regular.ttf "${pkgdir}/usr/share/fonts/TTF/XiaolaiMonoSC-Regular.ttf"
  install -Dm644 TTF\ \(Japanese\)/Kosefont-JP.ttf "${pkgdir}/usr/share/fonts/TTF/Kosefont-JP.ttf"
  install -Dm644 TTF\ \(Japanese\)/KosefontP-JP.ttf "${pkgdir}/usr/share/fonts/TTF/KosefontP-JP.ttf"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname%-git}/README.md"
  install -Dm644 OpenType_Features.md "${pkgdir}/usr/share/doc/${pkgname%-git}/OpenType_Features.md"
  install -Dm644 history.md "${pkgdir}/usr/share/doc/${pkgname%-git}/CHANGELOG.md"
  install -Dm644 SIL_Open_Font_License_1.1.txt "${pkgdir}/usr/share/licenses/${pkgname%-git}/OFL.txt"
}

pkgver() {
  cd "$srcdir/${_pkgname}"
  printf "%s" "$(head -n 1 history.md | grep -oE '[0-9]+\.[0-9]+').r$(git rev-list HEAD --count).g$(git rev-parse --short HEAD)"
}
