# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=2.8
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, fuzzy-finding and more'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg graphicsmagick ghostscript bat fzf dunst dialog xsel lolcat)
conflicts=(lfp-git ueberzug)
optdepends=(
  'nodejs: to make use of lfps built in node actions manager'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '838df9fce9266235351974455936f407a2c70188153b6c527f2d874337394a010a3cb2d0dc0ed17f3459fe02d6082adc87ae67c89143e55e0bf3a20d35479abb'
  '343755413a5c2248d3455869ce8bc0804c375164e929f765f84c72e13464fdad70e41384486faf4e4ee5775f075975246a1f004972e0509755ee5283338860f7'
  )
md5sums=(
  'bf1091a822d2385c1b8514abae9d9e81'
  '785cd886af37d41f30a1fee1ad4fc9ad'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
  install -Dm755 usr/bin/* -t "${pkgdir}/usr/bin"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
