# Maintainer: Connor Etherington <connor@concise.cc>
# ---
pkgname=lfp
pkgver=2.1
pkgrel=1
pkgdesc='LF-Preview, a wrapper for the lf file manager with image previews, and other features'
license=('MIT')
arch=('x86_64')
install="lfp.install"
url="https://gitlab.com/a4to/lfp"
depends=(lf zsh ffmpeg ueberzug graphicsmagick ghostscript bat)
optdepends=(
  'dialog: Required by many lfp functions outside the scope of image and video previews'
  'dunst: To receive notifications upon task completion and so forth'
  'git: cloning repos from within lfp'
  )
source=(
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst"
  "https://concise.cc/pkg/${pkgname}-${pkgver}-${pkgrel}-$arch.pkg.tar.zst.sig"
  )
sha512sums=(
  '16c2e9127e4b955bbf74a45724e2aa8ae5acd9abce288e25602f4e9ba826247cee7d506c907e62f19551ff69739abbf594f39a041147b7c383bb423b0d3157fb'
  'f96b1f6d101fcd9414d7d8b631856671165138c9a89a61e446616d2a77f11ca207df1daa5fce7eae52c944c4a91bd88f8d5484e87e5a7fa6f050f8a50366af4e'
  )
md5sums=(
  '0769d35e036faa60c80b32a2376ebd6b'
  'e6737f5c6474f7bd4b9c2cad612a01c8'
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
