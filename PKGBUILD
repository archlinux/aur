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
  '3dc9259f8169d9c1a76d1021c767a733f3f268e8de0dd9a3980c43a1212053fe04c57282c26cf3963aafcc6dd3fa838b302453f1eaf598c21df2fb6ea77ef166'
  '0bfc2f06848e45f74b9182360450d268d0d4e137f20563e0cf7110cf84ff74155bc61967afd6398c94b97e35060bbc9b66b6a7a7e1460d88f8cfda7465f6c445'
  )
md5sums=(
  '4b96ed9b14ef935e33e667cafe212fd7'
  '8bee0cd5b81d13c3903a48e2343e153e'
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
