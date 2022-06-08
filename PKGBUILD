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
  '8544739ec875561686de247c16a690217330d3333edad90f9bd9080b0e13ba52a58a0ab34e74dc72778118e2469a47f4d50da6d96305632722efd2125b444363'
  'dca34ac1993e46d14d4592487dab74e164a4c7b9de77225b18f4af9eab03bcd9639c492684ed26ba6948b53c418228b98fde8ef782bf0a2c5565d7d3ab7a3b8d'
  )
md5sums=(
  'c572dc2b49f14ec8ada3a977ef826031'
  'ac88186b52d9c17c228ac290860efa63'
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
