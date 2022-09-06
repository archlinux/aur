# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=2.7
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, fuzzy-finding and more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript bat fzf dunst dialog xsel lolcat)
conflicts=(lfp-git)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '9bff6a699787fdc6c6bef32014ecacd28ea671949678f8c4a502c97171aaa721be4027bd97f47293f3b60dacc8bba8f29cd91c99d21335e42f4f728d042f5b7d'
  '07bc3b686ae16f34d7f98baad92d4a690263bf40db6e81ae75f1b299d932b51d3c2525c12e5517ebafb866037225b22702098309c4b0400d053234a65b489dd0'
  )
md5sums=(
  '8f0dc4ceb27c900a0072fdcb9c3380fe'
  'f364af5cfd4b86293897bab92042549d'
  )
validpgpkeys=('81BACEEBC3EA26E127166E4A819BB92A9A48160E')

package() {
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
