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
  '000eea941cbfe9349219fdeec46e41a34b9bdf82978a9f81caf61be7da82521d4897af29307d9ccfc1f43776272c1fb8881dc10841bcb36d485f58588b13ecd6'
  '97bf0bf2ef8c8e84902b2107cab11c32e5b519c1d4c71f0527a8df049a10beee6c0a57a0217b9f814cffef2867974859fc4e869af2581201350789c9c407733d'
  )
md5sums=(
  '3b43b9e9546a9b3ba8c529cad4c81611'
  '98c1d3579a14853dd22da3a52f6a56d5'
  )
validpgpkeys=('9A1F3F41DDA55A60331CB8DD3714CB0967D15980')

package() {
  install -Dm755 usr/bin/${pkgname} "${pkgdir}/usr/bin/${pkgname}"
  install -Dm755 usr/share/${pkgname}/{lfp,lfpcd,cleaner,scope} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/${pkgname}/{lfp-icons,lfprc} -t "${pkgdir}/usr/share/${pkgname}"
  install -Dm644 usr/share/licenses/${pkgname}/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 usr/share/doc/${pkgname}/README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 usr/share/man/man1/${pkgname}.1.gz "${pkgdir}/usr/share/man/man1/${pkgname}.1.gz"
}
